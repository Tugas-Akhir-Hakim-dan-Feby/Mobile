import 'package:api_mobile/model/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatefulWidget {
  final Data data;

  const PaymentMethod({Key? key, required this.data}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  InAppWebViewController? _controller;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

 void _navigateToNavigasiPage() {
  if (_controller != null) {
    _controller!.canGoBack().then((canGoBack) {
      if (canGoBack) {
        _controller!.goBack();
      } else {
          Get.offNamedUntil('/navigasi_page', (route) => false);
      }
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Laper"),
      //   actions: [],
      // ),
      body: WillPopScope(
        onWillPop: () async {
          // if (_controller != null) {
          //   if (await _controller!.canGoBack ()) {
          //     _controller!.goBack();
          //     return false;
          //   }
          // }
          return true;
        },
        child: Navigator(
          key: _navigatorKey,
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(widget.data.paymentLink!)),
                onWebViewCreated: (controller) {
                  _controller = controller;
                },
                onLoadStart: (controller, url) {
                  if (url.toString() == 'https://develop-ta.berobatplus.shop/invoice/success') {
                  _navigateToNavigasiPage();
                  }
                },
                // onLoadStop: (controller, url) {
                //   // Check if payment is PAID and navigate to home
                //   // controller.evaluateJavascript(source: "console.log('Payment status: ${widget.data.status}');");
                //   if (widget.data.status == 'PAID') {
                //     _navigateToNavigasiPage();
                //   }
                // },
                // initialOptions: InAppWebViewGroupOptions(
                //   // ...
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
}

