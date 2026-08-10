import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  String version = "1.0.0";

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("عن التطبيق"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              child: Icon(
                Icons.handyman,
                size: 45,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "تطبيق معلم",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "يهدف تطبيق معلم إلى تسهيل الوصول إلى الحرفيين المهرة وربطهم بالأشخاص الذين يحتاجون إلى خدماتهم، من خلال منصة سهلة وسريعة تساعد في العثور على الحرفي المناسب في مختلف التخصصات.\n\n"
              "سواء كنت تبحث عن كهربائي، سباك، نجار، دهان، فني تكييف، أو أي حرفة أخرى، فإن تطبيق معلم يوفر لك وسيلة مريحة للتواصل مع الحرفيين وإنجاز أعمالك بسهولة.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.7,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text("المطور"),
                subtitle: const Text("عبدالعظيم جبريل"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text("البريد الإلكتروني"),
                subtitle: const Text("abdogx413@gmail.com"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text("الإصدار"),
                subtitle: Text(version),
              ),
            ),

            const SizedBox(height: 30),

            const Divider(),

            const SizedBox(height: 10),

            const Text(
              "شكراً لاستخدام تطبيق معلم ❤️",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "نعمل باستمرار على تطوير التطبيق وتحسين خدماته لتقديم أفضل تجربة للمستخدمين.",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            const Text(
              "© 2026 عبدالعظيم جبريل\nجميع الحقوق محفوظة",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}