import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/core/network/firebase_exception.dart';
import 'package:malam/core/services/backend_service.dart';
import 'package:malam/feature/order/data/model_order.dart';

class RepoOrder {
  Future<void> order({
    required String userid,
    required String orderstatus,
    required String acceptedby,
    required String description,
    required String service,
    required String address,
    required List<String> rejectedby,
  }) async {
    try {
      final docRef = FirebaseFirestore.instance.collection("orders").doc();

      await docRef.set({
        "userid": userid,
        "orderstatus": orderstatus,
        "acceptedby": acceptedby,
        "rejectedby": rejectedby,
        "description": description,
        "service": service,
        "address": address,
        "deleteduser": false,
        "orderId": docRef.id,
        "createdAt": FieldValue.serverTimestamp(),
      });
      await BackendService.sendOrderNotification(
        service: service,
        address: address,
      );
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  Future<List<ModelOrder>> getorder(String userid) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("orders")
          .where("orderstatus", whereIn: ["قبول","قيدالانتظار"])
          .where("userid", isEqualTo: userid)
          .where("deleteduser", isEqualTo: false)
          .get();
      return response.docs
          .map((docs) => ModelOrder.fromMap(docs.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  Future<List<ModelOrder>> getorderhistory(String userid) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("orders")
          .where("orderstatus", whereIn: ["مكتمل", "رفض"])
          .where("userid", isEqualTo: userid)
          .where("deleteduser", isEqualTo: false)
          .get();
      return response.docs
          .map((docs) => ModelOrder.fromMap(docs.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  Future<void> removeorder(String orderid) async {
    try {
      await FirebaseFirestore.instance.collection("orders").doc(orderid).update(
        {"deleteduser": true},
      );
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }
}
