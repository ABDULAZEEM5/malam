import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/core/network/firebase_exception.dart';
import 'package:malam/feature/messages/data/modle.dart';

class RepoMessage {
  Future<void> sendMessage({
    required String message,
    required String senderId,
    required String orderId,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("chat")
          .doc(orderId)
          .collection("messages")
          .add({
            "message": message,
            "senderId": senderId,
            "createdAt": FieldValue.serverTimestamp(),
            "isRead": false,
          });
      await FirebaseFirestore.instance.collection("chat").doc(orderId).update({
        "lastmessage": message,
        "lastmessagetime": FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  Stream<List<MessageModel>> getMessage({required String orderId}) {
    return FirebaseFirestore.instance
        .collection("chat")
        .doc(orderId)
        .collection("messages")
        .orderBy("createdAt", descending: false)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => MessageModel.fromFirestore(doc))
              .toList(),
        );
  }

  Future<void> markMessagesAsRead(String orderId) async {
    try {
      final currentUserId = FirebaseAuth.instance.currentUser!.uid;
      final snapshot = await FirebaseFirestore.instance
          .collection("chat")
          .doc(orderId)
          .collection("messages")
          .where("isRead", isEqualTo: false)
          .get();
      if (snapshot.docs.isEmpty) {
        return;
      }
      final batch = FirebaseFirestore.instance.batch();

      for (final doc in snapshot.docs) {
        final data = doc.data();
        if (data["senderId"] != currentUserId) {
          batch.update(doc.reference, {
            "isRead": true,
            "readAt": FieldValue.serverTimestamp(),
          });
        }
      }

      await batch.commit();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }
}
