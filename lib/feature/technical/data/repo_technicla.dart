import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/core/network/firebase_exception.dart';
import 'package:malam/feature/technical/data/modle_technical.dart';

class RepoTechnicla {
  Future<List<ModleTechnical>> gettechnical() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("technical")
          .get();

      return response.docs
          .map((doc) => ModleTechnical.fromMap(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

  Future<ModleTechnical> getnoetechnical() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("technical")
          .limit(1)
          .get();

      return ModleTechnical.fromMap(response.docs.first.data());
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }
}
