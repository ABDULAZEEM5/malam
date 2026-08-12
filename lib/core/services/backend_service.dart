import 'package:http/http.dart' as http;
import 'package:malam/core/constans/app_linkurl.dart';

class BackendService {
  // استبدل IP بعنوان جهاز الكمبيوتر
  static const String baseUrl = AppLinkurl.link;

  static Future<void> sendOrderNotification({
    required String service,
    required String address,
    required String craftsmanId,
  }) async {
    final uri = Uri.parse(
      "$baseUrl/send-order?service=$service&address=$address&craftsmanId=$craftsmanId",
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Failed to send notification");
    }
  }
}
