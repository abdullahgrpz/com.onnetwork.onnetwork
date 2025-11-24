import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_network/features/home/providers/home_providers.dart';
import 'package:on_network/features/team/models/team_member_model.dart';
import 'package:on_network/features/team/widgets/team_member_list_item.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math';
import 'package:on_network/core/widgets/skeletons/team_screen_skeleton.dart';
import 'package:on_network/core/widgets/skeletons/skeleton_box.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:on_network/core/services/ad_service.dart';
import 'package:on_network/features/team/widgets/invite_share_card.dart';
import 'package:on_network/generated/l10n/app_localizations.dart';

class TeamScreen extends ConsumerStatefulWidget {
  const TeamScreen({super.key});

  @override
  ConsumerState<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends ConsumerState<TeamScreen> {
  final GlobalKey _inviteCardKey = GlobalKey();

  void _remindMember(BuildContext context, WidgetRef ref, TeamMember member) async {
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.teamRemindSnackbar(member.username)),
        backgroundColor: const Color(0xFF00D1FF),
        duration: const Duration(seconds: 2),
      ),
    );
    final teamService = ref.read(teamServiceProvider);
    final errorMessage = await teamService.remindMember(member.uid);
    if (context.mounted && errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.teamRemindError(errorMessage)), backgroundColor: Colors.red),
      );
    } else if (context.mounted && errorMessage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.teamRemindSuccess(member.username)), backgroundColor: Colors.green, duration: const Duration(seconds: 2)),
      );
      ref.invalidate(teamMembersProvider);
    }
  }

  void _showReportDialog(BuildContext context, WidgetRef ref, TeamMember member) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          title: Text(l10n.teamReportDialogTitle(member.username), style: const TextStyle(color: Colors.redAccent)),
          content: Text(l10n.teamReportDialogContent, style: const TextStyle(color: Colors.white70)),
          actions: [
            TextButton(child: Text(l10n.authCancel, style: const TextStyle(color: Colors.white70)), onPressed: () => Navigator.of(dialogContext).pop()),
            TextButton(
              child: Text(l10n.teamReportDialogButton, style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.teamReportSnackbar(member.username))));
                final teamService = ref.read(teamServiceProvider);
                final errorMessage = await teamService.reportUser(member.uid, "Inappropriate Content");
                if (context.mounted) {
                  if (errorMessage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.teamReportSuccess), backgroundColor: Colors.green));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.teamReportError(errorMessage)), backgroundColor: Colors.red));
                  }
                }
              },
            ),
          ],
        );
      },
    );
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

  Future<void> _shareInviteCard(BuildContext context, String inviteCode) async {
    final l10n = AppLocalizations.of(context)!;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.teamShareImageGenerating), duration: const Duration(seconds: 10)));

    try {
      RenderRepaintBoundary boundary = _inviteCardKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) throw Exception("Could not convert image to bytes.");
      Uint8List pngBytes = byteData.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/on_network_invite.png').create();
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
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(l10n.teamShareImageError(e.toString())), backgroundColor: Colors.red));
      _shareInviteText(inviteCode);
    }
  }

  // DÜZELTME: Artık username alıyor
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
                key: _inviteCardKey, 
                child: InviteShareCard(
                  inviteCode: inviteCode,
                  username: username, // <--- İSMİ KARTA GEÇİRİYORUZ
                  buttonText: l10n.inviteCardButton,
                  titleText: l10n.inviteCardTitle,
                  inviteCodeLabel: l10n.inviteCardUseCode,
                )
              )
            ),
            AlertDialog(
              backgroundColor: Theme.of(context).cardColor,
              title: Text(l10n.teamShareTitle, style: const TextStyle(color: Colors.white)),
              content: Text(l10n.teamShareSubtitle, style: const TextStyle(color: Colors.white70)),
              actionsPadding: const EdgeInsets.all(8.0),
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.image, color: Colors.white),
                      label: Text(l10n.teamShareImageButton, style: const TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00D1FF), padding: const EdgeInsets.symmetric(vertical: 12)),
                      onPressed: () { Navigator.of(dialogContext).pop(); _shareInviteCard(context, inviteCode); },
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final asyncUserData = ref.watch(userDataStreamProvider);
    final asyncTeamMembers = ref.watch(teamMembersProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D2E),
      appBar: AppBar(
        title: Text(l10n.teamScreenTitle),
        backgroundColor: const Color(0xFF0D0D2E),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            tooltip: l10n.teamRefreshTooltip,
            onPressed: () {
              ref.invalidate(teamMembersProvider);
              ref.invalidate(userDataStreamProvider);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.teamRefreshSnackbar), duration: const Duration(seconds: 1)));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: const Color(0xFF00D1FF),
          backgroundColor: const Color(0xFF1A1A2E),
          onRefresh: () async { ref.invalidate(teamMembersProvider); ref.invalidate(userDataStreamProvider); },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                asyncUserData.when(
                  loading: () => const SkeletonBox(width: 250, height: 18),
                  error: (err, st) => Text(l10n.teamErrorInviteCode, style: TextStyle(color: Colors.red.shade300)),
                  data: (userDoc) {
                    final inviteCode = (userDoc.data() as Map<String, dynamic>?)?['referral_code'] ?? '...';
                    return SelectableText(l10n.teamInviteCode(inviteCode), style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.bold));
                  },
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: asyncTeamMembers.when(
                    loading: () => const TeamScreenSkeleton(),
                    error: (err, st) => Center(child: Text(l10n.teamErrorLoading, textAlign: TextAlign.center, style: TextStyle(color: Colors.red.shade300))),
                    data: (teamMembers) {
                      final currentUserData = (asyncUserData.value?.data() as Map<String, dynamic>?) ?? {};
                      final currentBaseRate = (currentUserData['base_mining_rate'] as num?)?.toDouble() ?? 0.0;
                      final currentProfileImageUrl = currentUserData['profileImageUrl'];
                      final inviteCode = currentUserData['referral_code'] ?? '...';
                      
                      // --- DÜZELTME: Kullanıcı adını çekiyoruz ---
                      final currentUsername = currentUserData['username'] ?? 'A Pioneer'; 
                      // -------------------------------------------

                      final orbitalMembers = teamMembers.take(6).toList();
                      final int activeMembers = teamMembers.where((m) => m.isActive).length;
                      final int teamSize = teamMembers.length;
                      final String currentTier = currentUserData['current_bonus_tier'] ?? 'Standard';
                      final double currentBonusPercentage = (currentUserData['current_bonus_percentage'] as num?)?.toDouble() ?? 0.25;
                      String nextTierGoal;
                      IconData currentTierIcon = Icons.shield;
                      if (currentTier == "Standard") { nextTierGoal = l10n.teamNextGoalBronze(max(0, 5 - teamSize).toString()); currentTierIcon = Icons.shield_outlined; }
                      else if (currentTier == "Bronze") { nextTierGoal = l10n.teamNextGoalSilver(max(0, 10 - teamSize).toString()); currentTierIcon = Icons.security; }
                      else if (currentTier == "Silver") { nextTierGoal = l10n.teamNextGoalGold(max(0, 25 - teamSize).toString()); currentTierIcon = Icons.verified_user; }
                      else { nextTierGoal = l10n.teamNextGoalMax; }
                      final double totalContribution = activeMembers * currentBonusPercentage * currentBaseRate;

                      if (teamMembers.isEmpty) {
                        return Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.people_outline, color: Colors.white.withOpacity(0.3), size: 80),
                                const SizedBox(height: 16),
                                Text(l10n.teamEmptyTitle, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18)),
                                const SizedBox(height: 8),
                                Text(l10n.teamEmptyDescription, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14)),
                                const SizedBox(height: 24),
                                ElevatedButton.icon(
                                  // DÜZELTME: Kullanıcı adını fonksiyona veriyoruz
                                  onPressed: () => _showInviteOptions(context, inviteCode, currentUsername),
                                  icon: const Icon(Icons.person_add_alt_1, color: Colors.white),
                                  label: Text(l10n.teamInviteButton, style: const TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00D1FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                                ),
                                const SizedBox(height: 8),
                                Consumer(builder: (context, ref, child) {
                                    final bannerAdAsync = ref.watch(bannerAdProvider);
                                    return bannerAdAsync.when(data: (bannerAd) => Container(width: double.infinity, height: bannerAd.size.height.toDouble(), alignment: Alignment.center, child: AdWidget(ad: bannerAd)), loading: () => const SkeletonBox(height: 50, width: double.infinity), error: (err, stack) => const SizedBox(height: 50));
                                }),
                                const SizedBox(height: 4),
                              ],
                            ),
                          ),
                        );
                      }
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(TextSpan(text: l10n.teamYourContribution("").split('+')[0], style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16), children: <TextSpan>[TextSpan(text: '+${totalContribution.toStringAsFixed(2)} ON/hour', style: const TextStyle(color: Color(0xFF00D1FF), fontWeight: FontWeight.bold))])),
                            Row(children: [Icon(currentTierIcon, color: Colors.amber, size: 16), const SizedBox(width: 4), Text(l10n.teamBonusTier(currentTier, (currentBonusPercentage * 100).toStringAsFixed(0)), style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16))]),
                            Text(l10n.teamNextGoal(nextTierGoal), style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                            Text(l10n.teamMemberCount(teamSize.toString(), activeMembers.toString()), style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16)),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                                // DÜZELTME: Kullanıcı adını fonksiyona veriyoruz (Liste dolu iken)
                                onPressed: () => _showInviteOptions(context, inviteCode, currentUsername), 
                                icon: const Icon(Icons.person_add_alt_1, color: Colors.white), 
                                label: Text(l10n.teamInviteButton, style: const TextStyle(color: Colors.white)), 
                                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00D1FF).withOpacity(0.2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: Color(0xFF00D1FF))))
                            ),
                            const SizedBox(height: 20),
                            Center(child: SizedBox(height: 160, width: 160, child: Stack(alignment: Alignment.center, children: [CircleAvatar(radius: 40, backgroundColor: Theme.of(context).cardColor, backgroundImage: currentProfileImageUrl != null ? NetworkImage(currentProfileImageUrl) : null, child: currentProfileImageUrl == null ? const Icon(Icons.person, size: 40, color: Color(0xFF00D1FF)) : null), ...List.generate(orbitalMembers.length, (index) { final angle = 2 * pi * index / orbitalMembers.length; final x = 70 * cos(angle); final y = 70 * sin(angle); final member = orbitalMembers[index]; return Transform.translate(offset: Offset(x, y), child: CircleAvatar(radius: 20, backgroundColor: Theme.of(context).cardColor, backgroundImage: member.profileImageUrl != null ? NetworkImage(member.profileImageUrl!) : null, child: member.profileImageUrl == null ? const Icon(Icons.person_outline, size: 20, color: Colors.white54) : null)); })]))),
                            const SizedBox(height: 20),
                            ListView.builder(itemCount: teamMembers.length, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemBuilder: (context, index) { final member = teamMembers[index]; final currentUserId = asyncUserData.value?.id; final isSelf = (currentUserId == member.uid); return TeamMemberListItem(member: member, currentBaseRate: currentBaseRate, currentBonusPercentage: currentBonusPercentage, onRemind: member.isActive ? null : () => _remindMember(context, ref, member), onReport: isSelf ? null : () => _showReportDialog(context, ref, member)); }),
                            const SizedBox(height: 8),
                            Consumer(builder: (context, ref, child) { final bannerAdAsync = ref.watch(bannerAdProvider); return bannerAdAsync.when(data: (bannerAd) => Container(width: double.infinity, height: bannerAd.size.height.toDouble(), alignment: Alignment.center, child: AdWidget(ad: bannerAd)), loading: () => const SkeletonBox(height: 50, width: double.infinity), error: (err, stack) => const SizedBox(height: 50)); }),
                            const SizedBox(height: 4),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}