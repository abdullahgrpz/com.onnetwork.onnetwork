import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart'; 

// Servisler
import 'package:on_network/features/auth/services/auth_service.dart';
import 'package:on_network/features/home/providers/home_providers.dart';
import 'package:on_network/core/services/storage_service.dart';

// Ekranlar
import 'package:on_network/features/auth/view/login_screen.dart';
import 'package:on_network/features/profile/view/legal_webview_screen.dart';
import 'package:on_network/features/profile/view/project_info_screen.dart';
import 'package:on_network/features/profile/view/settings_screen.dart';
import 'package:on_network/features/team/widgets/invite_share_card.dart';

import 'package:on_network/navigation_shell.dart';
import 'package:on_network/generated/l10n/app_localizations.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey _profileInviteCardKey = GlobalKey();

  bool _isLoading = false;
  bool _isEditingUsername = false;
  File? _selectedImage;
  
  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _initUsername(String currentUsername) {
    _usernameController.text = currentUsername;
  }

  void _openLegalDocument(String title, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => LegalWebViewScreen(title: title, url: url)),
    );
  }

  Future<void> _launchExternalURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $urlString';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Link hatası: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _launchEmail(BuildContext context) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@onnetworkapp.com',
      query: 'subject=ON Network Support',
    );
    try {
      if (!await launchUrl(emailUri)) {
        throw 'Could not launch $emailUri';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email hatası: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _pickAndUploadImage() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() { _isLoading = true; });
    
    final storageService = ref.read(storageServiceProvider);
    final imageFile = await storageService.pickImage();
    
    if (imageFile == null) {
      setState(() { _isLoading = false; });
      return;
    }
    setState(() { _selectedImage = imageFile; });

    final imageUrl = await storageService.uploadProfileImage(imageFile);
    if (imageUrl == null) {
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.profileImageUploadFailed), backgroundColor: Colors.red));
      setState(() { _isLoading = false; });
      return;
    }

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("User logged out");
      
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'profileImageUrl': imageUrl,
      });
      
      ref.invalidate(userDataStreamProvider);
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.profileImageUploadSuccess), backgroundColor: Colors.green));
    } catch (e) {
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.profileErrorImageSave(e.toString())), backgroundColor: Colors.red));
    }
    setState(() { _isLoading = false; _selectedImage = null; });
  }

  Future<void> _updateUsername() async {
    final l10n = AppLocalizations.of(context)!;

    if (_formKey.currentState?.validate() != true) return;

    setState(() { _isLoading = true; });
    final newUsername = _usernameController.text.trim();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final functions = FirebaseFunctions.instance;

    try {
      final callable = functions.httpsCallable('checkUsernameUniqueness');
      final result = await callable.call(<String, dynamic>{'username': newUsername});

      if (result.data['isUnique'] == false) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.profileErrorUsernameTaken), backgroundColor: Colors.red));
        setState(() { _isLoading = false; });
        return;
      }

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("User logged out");

      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'username': newUsername,
        'usernameLastChangedAt': FieldValue.serverTimestamp(),
      });

      ref.invalidate(userDataStreamProvider);
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.profileUsernameUpdated), backgroundColor: Colors.green));
      setState(() { _isEditingUsername = false; });

    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('Hata: $e'), backgroundColor: Colors.red));
    }
    setState(() { _isLoading = false; });
  }

  void _handleEditUsernamePressed() {
    if (_isEditingUsername) {
      _updateUsername();
    } else {
      setState(() { _isEditingUsername = true; });
    }
  }

  void _shareInviteText(String inviteCode) {
    final l10n = AppLocalizations.of(context)!;
    final String message = l10n.teamShareTextMessage(inviteCode);
    
    final box = context.findRenderObject() as RenderBox?;
    Share.share(
      message,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  Future<void> _shareInviteCard(BuildContext context, String inviteCode, String username) async {
    final l10n = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.teamShareImageGenerating), duration: const Duration(seconds: 2)));

    try {
      RenderRepaintBoundary boundary = _profileInviteCardKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/on_network_invite_profile.png').create();
      await file.writeAsBytes(pngBytes);

      scaffoldMessenger.hideCurrentSnackBar();

      final box = context.findRenderObject() as RenderBox?;
      await Share.shareXFiles(
        [XFile(file.path)],
        text: l10n.teamShareImageMessage(inviteCode),
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );

    } catch (e) {
      scaffoldMessenger.hideCurrentSnackBar();
      _shareInviteText(inviteCode);
    }
  }

  // GÜNCELLENEN FONKSİYON: Artık 'username' alıyor
  void _showInviteOptions(BuildContext context, String inviteCode, String username) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Stack(
          children: [
            Positioned(
              top: -1000,
              left: 0,
              child: RepaintBoundary(
                key: _profileInviteCardKey,
                child: InviteShareCard(
                  inviteCode: inviteCode,
                  username: username, // <--- BURASI EKLENDİ: Kullanıcı adını karta gönderiyoruz
                  buttonText: l10n.inviteCardButton,
                  titleText: l10n.inviteCardTitle,
                  inviteCodeLabel: l10n.inviteCardUseCode,
                ),
              ),
            ),
            AlertDialog(
              backgroundColor: Theme.of(context).cardColor,
              title: Text(l10n.teamShareTitle, style: const TextStyle(color: Colors.white)),
              content: Text(l10n.teamShareSubtitle, style: const TextStyle(color: Colors.white70)),
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.image, color: Colors.white),
                      label: Text(l10n.teamShareImageButton, style: const TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00D1FF), padding: const EdgeInsets.symmetric(vertical: 12)),
                      onPressed: () { 
                        Navigator.of(dialogContext).pop(); 
                        _shareInviteCard(context, inviteCode, username); 
                      },
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.text_fields, color: Colors.white70),
                      label: Text(l10n.teamShareTextButton, style: const TextStyle(color: Colors.white70)),
                      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white.withOpacity(0.3)), padding: const EdgeInsets.symmetric(vertical: 12)),
                      onPressed: () { Navigator.of(dialogContext).pop(); _shareInviteText(inviteCode); },
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDeleteAccountDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    bool isDeleting = false;

    return showDialog<void>(
      context: context,
      barrierDismissible: !isDeleting,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).cardColor,
              title: Text(l10n.profileDeleteAccountDialogTitle, style: const TextStyle(color: Colors.redAccent)),
              content: Text(l10n.profileDeleteAccountDialogContent, style: TextStyle(color: Colors.white.withOpacity(0.8))),
              actions: <Widget>[
                TextButton(
                  onPressed: isDeleting ? null : () => Navigator.of(dialogContext).pop(),
                  child: Text(l10n.authCancel, style: TextStyle(color: Colors.white.withOpacity(0.7))),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: isDeleting ? null : () async {
                    setDialogState(() { isDeleting = true; });
                    
                    final AuthService authService = AuthService();
                    String? error;
                    try { error = await authService.deleteUserAccount(); } catch (e) { error = e.toString(); }

                    if (dialogContext.mounted) Navigator.of(dialogContext).pop();

                    if (error == null) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.profileDeleteAccountSuccess), backgroundColor: Colors.green));
                        ref.read(navigationShellIndexProvider.notifier).state = 0;
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (Route<dynamic> route) => false);
                      }
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.profileDeleteAccountError(error)), backgroundColor: Colors.red));
                        setDialogState(() { isDeleting = false; });
                      }
                    }
                  },
                  child: isDeleting ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : Text(l10n.profileDeleteAccountDialogButton, style: const TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0, left: 16.0),
      child: Text(title.toUpperCase(), style: TextStyle(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final asyncUserData = ref.watch(userDataStreamProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D2E),
      appBar: AppBar(
        title: Text(l10n.profileScreenTitle),
        backgroundColor: const Color(0xFF0D0D2E),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            tooltip: l10n.profileSignOut,
            onPressed: () async {
              await AuthService().signOut();
              if (context.mounted) {
                 ref.read(navigationShellIndexProvider.notifier).state = 0;
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginScreen()), (Route<dynamic> route) => false);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: asyncUserData.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
            data: (userDoc) {
              final userData = userDoc.data() as Map<String, dynamic>? ?? {};
              final email = userData['email'] ?? 'Loading...';
              final inviteCode = userData['referral_code'] ?? '...';
              final currentUsername = userData['username'] ?? '';
              final profileImageUrl = userData['profileImageUrl'];
              
              if (!_isEditingUsername && _usernameController.text != currentUsername) {
                _initUsername(currentUsername);
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: _isLoading ? null : _pickAndUploadImage,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey.shade800,
                                  backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : (profileImageUrl != null ? NetworkImage(profileImageUrl) : null) as ImageProvider?,
                                  child: _selectedImage == null && profileImageUrl == null ? const Icon(Icons.person, size: 50, color: Color(0xFF00D1FF)) : null,
                                ),
                                if (_isLoading && _selectedImage != null)
                                  const CircularProgressIndicator()
                                else
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.edit, color: Color(0xFF00D1FF), size: 20),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(email, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _usernameController,
                        readOnly: !_isEditingUsername,
                        decoration: InputDecoration(
                          labelText: l10n.profileUsername,
                          prefixIcon: const Icon(Icons.alternate_email, color: Colors.white70),
                          suffixIcon: IconButton(
                            icon: Icon(_isEditingUsername ? Icons.save : Icons.edit, color: _isEditingUsername ? const Color(0xFF00D1FF) : Colors.white70),
                            onPressed: _isLoading ? null : _handleEditUsernamePressed,
                          ),
                        ),
                        style: TextStyle(color: _isEditingUsername ? Colors.white : Colors.white54),
                        validator: (value) => (value == null || value.trim().length < 4) ? l10n.profileErrorUsernameLength : null,
                      ),
                    ),

                    _buildSectionHeader(l10n.profileSectionCommunity),
                    _buildProfileOption(
                      icon: Icons.share,
                      title: l10n.profileInviteCode(inviteCode),
                      subtitle: l10n.profileShare,
                      onTap: () => _showInviteOptions(context, inviteCode, currentUsername), // <--- BURADA İSMİ GÖNDERİYORUZ
                    ),
                    _buildProfileOption(
                      icon: Icons.copy,
                      title: l10n.profileCopyCode,
                      subtitle: l10n.profileCopyCodeSubtitle,
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: inviteCode));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.profileCopyCodeSuccess)));
                      },
                    ),
                    
                    // SOSYAL MEDYA LİNKLERİ
                    _buildProfileOption(
                      icon: FontAwesomeIcons.telegram,
                      title: l10n.profileTelegram,
                      subtitle: l10n.profileTelegramSubtitle,
                      onTap: () => _launchExternalURL('https://t.me/onnetworkapp'),
                    ),
                    _buildProfileOption(
                      icon: FontAwesomeIcons.xTwitter,
                      title: l10n.profileTwitter,
                      subtitle: l10n.profileTwitterSubtitle,
                      onTap: () => _launchExternalURL('https://x.com/onnetworkapp'),
                    ),
                    _buildProfileOption(
                      icon: FontAwesomeIcons.instagram,
                      title: l10n.profileInstagram,
                      subtitle: l10n.profileInstagramSubtitle,
                      onTap: () => _launchExternalURL('https://www.instagram.com/onnetworkapp/'),
                    ),
                     _buildProfileOption(
                      icon: FontAwesomeIcons.youtube,
                      title: l10n.profileYoutube,
                      subtitle: l10n.profileYoutubeSubtitle,
                      onTap: () => _launchExternalURL('https://www.youtube.com/@onnetworkapp'),
                    ),
                    _buildProfileOption(
                      icon: FontAwesomeIcons.facebook,
                      title: l10n.profileFacebook,
                      subtitle: l10n.profileFacebookSubtitle,
                      onTap: () => _launchExternalURL('https://www.facebook.com/profile.php?id=61583532664936'),
                    ),
                    _buildProfileOption(
                      icon: FontAwesomeIcons.tiktok,
                      title: l10n.profileTikTok,
                      subtitle: l10n.profileTikTokSubtitle,
                      onTap: () => _launchExternalURL('https://www.tiktok.com/@onnetworkapp'),
                    ),
                    _buildProfileOption(
                      icon: FontAwesomeIcons.globe,
                      title: l10n.profileWebsite,
                      subtitle: l10n.profileWebsiteSubtitle,
                      onTap: () => _launchExternalURL('https://onnetworkapp.com'),
                    ),
                    _buildProfileOption(
                      icon: FontAwesomeIcons.envelope,
                      title: l10n.profileEmail,
                      subtitle: l10n.profileEmailSubtitle,
                      onTap: () => _launchEmail(context),
                    ),

                    _buildSectionHeader(l10n.profileSectionSettings),
                    _buildProfileOption(
                      icon: Icons.notifications_active_outlined,
                      title: l10n.profileNotifSettings,
                      subtitle: l10n.profileNotifSettingsSubtitle,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen())),
                    ),
                    _buildProfileOption(
                      icon: Icons.lock_reset,
                      title: l10n.profileChangePassword,
                      subtitle: l10n.profileChangePasswordSubtitle,
                      onTap: () async {
                        final email = FirebaseAuth.instance.currentUser?.email;
                        if (email == null) return;
                        final error = await AuthService().sendPasswordResetEmail(email);
                        if (context.mounted) {
                          if (error == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.profileChangePasswordSuccess), backgroundColor: Colors.green));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error), backgroundColor: Colors.red));
                          }
                        }
                      },
                    ),

                    _buildSectionHeader(l10n.profileSectionAbout),
                    _buildProfileOption(
                      icon: Icons.info_outline,
                      title: l10n.profileProjectInfo,
                      subtitle: l10n.profileProjectInfoSubtitle,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProjectInfoScreen())),
                    ),
                    _buildProfileOption(
                      icon: Icons.description_outlined,
                      title: l10n.profileTerms,
                      subtitle: l10n.profileTermsSubtitle,
                      onTap: () => _openLegalDocument(l10n.profileTerms, 'https://onnetworkapp.com/terms.html'),
                    ),
                    _buildProfileOption(
                      icon: Icons.privacy_tip_outlined,
                      title: l10n.profilePrivacy,
                      subtitle: l10n.profilePrivacySubtitle,
                      onTap: () => _openLegalDocument(l10n.profilePrivacy, 'https://onnetworkapp.com/privacy.html'),
                    ),

                    _buildSectionHeader(l10n.profileSectionDanger),
                    _buildProfileOption(
                      icon: Icons.delete_forever,
                      title: l10n.profileDeleteAccount,
                      subtitle: l10n.profileDeleteAccountSubtitle,
                      onTap: () => _showDeleteAccountDialog(context, ref),
                    ),
                    const SizedBox(height: 24),
                    
                    // --- VERSİYON BİLGİSİ ---
                    FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Center(child: Text("v${snapshot.data!.version}", style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12)));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF00D1FF)),
      title: Text(title, style: const TextStyle(color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.7)), maxLines: 1, overflow: TextOverflow.ellipsis),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}