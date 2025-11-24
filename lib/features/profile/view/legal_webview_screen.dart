import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class LegalWebViewScreen extends StatefulWidget {
  final String title;
  final String url;

  const LegalWebViewScreen({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<LegalWebViewScreen> createState() => _LegalWebViewScreenState();
}

class _LegalWebViewScreenState extends State<LegalWebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF0D0D2E))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // İlerleme çubuğu güncellemeleri
          },
          onPageStarted: (String url) {
            setState(() { _isLoading = true; });
          },
          onPageFinished: (String url) {
            setState(() { _isLoading = false; });
          },
          onWebResourceError: (WebResourceError error) {
            print('Web sayfasında hata: ${error.description}');
            if(mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Hata: Sayfa yüklenemedi. URL: ${widget.url}'), backgroundColor: Colors.red),
              );
              // Hata durumunda yükleniyor durumunu bitir
              setState(() { _isLoading = false; });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    // Platforma özgü ayarlar (Android hızlandırması için)
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 1,
      ),
      body: Stack(
        children: [
          // WebView'ı göster
          WebViewWidget(controller: _controller),

          // Sayfa yüklenirken yükleniyor göstergesini göster
          if (_isLoading)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(color: Color(0xFF00D1FF)),
                  const SizedBox(height: 16),
                  Text('Loading ${widget.title}...', style: TextStyle(color: Colors.white.withOpacity(0.8))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
