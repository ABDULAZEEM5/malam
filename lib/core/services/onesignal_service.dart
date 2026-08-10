import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OneSignalService {
  static Future<void> init() async {
    OneSignal.initialize(
      "01af5a9f-b901-4ff9-abbd-54b3fa1c2538",
    );

    await OneSignal.Notifications.requestPermission(true);

    // إذا كان الـ ID موجودًا بالفعل
    final id = OneSignal.User.pushSubscription.id;
    if (id != null) {
      await saveId(id);
    }

    // الاستماع لأي تغيير في الاشتراك
    OneSignal.User.pushSubscription.addObserver((state) async {
      final newId = state.current.id;

    

      if (newId != null) {
        await saveId(newId);
      }
    });
  }

  static Future<void> saveId(String id) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .update({
      "oneSignalId": id,
    });
  }
}