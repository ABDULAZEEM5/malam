import 'package:http/http.dart' as http;

class BackendService {
  // استبدل IP بعنوان جهاز الكمبيوتر
  static const String baseUrl = "http://192.168.100.21:3000";

  static Future<void> sendOrderNotification({
    required String service,
    required String address,
  }) async {
    final uri = Uri.parse(
      "$baseUrl/send-order?service=$service&address=$address",
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Failed to send notification");
    }
  }
}