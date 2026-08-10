import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/core/network/firebase_exception.dart';
import 'package:malam/feature/home/data/modle_home.dart';

class RepoHome {
  Future<List<ModleHome>> getService() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("services")
          .get();
      return response.docs.map((doc) => ModleHome.fromMap(doc.data())).toList();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  Future<List<ModleNotification>> getnotification(String userid) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("notifications")
          .doc(userid)
          .collection("items")
          .get();
      return response.docs
          .map((doc) => ModleNotification.fromMap(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }
}
