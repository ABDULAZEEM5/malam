import 'package:flutter/material.dart';
import 'package:malam/sheard/custom_text.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: const [
            Icon(Icons.wifi_off, size: 90, color: Colors.red),

            SizedBox(height: 20),

            CustomText(
              text: "لا يوجد اتصال بالإنترنت",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),

            SizedBox(height: 10),

            CustomText(
              text: "سنعيد المحاولة تلقائيا عند عودة الاتصال",
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
