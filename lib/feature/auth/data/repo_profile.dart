import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:malam/core/constans/app_linkurl.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/core/network/firebase_exception.dart';
import 'package:malam/feature/auth/data/user_model.dart';

class RepoProfile {
  ///  Upload Image to Cloudinary
 Future<Map<String, String>> uploadImage(File file) async {
    try {
      final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/dz4dxrw3/image/upload",
      );

      final request = http.MultipartRequest("POST", url);

      request.fields["upload_preset"] = "malampictures";
      request.fields["folder"] = "profile";

      request.files.add(await http.MultipartFile.fromPath("file", file.path));

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode != 200) {
        throw ApiErorr(message: responseBody);
      }

      final Map<String, dynamic> data = jsonDecode(responseBody);

      if (data["secure_url"] == null || data["public_id"] == null) {
        throw ApiErorr(
          message: "لم يتم الحصول على بيانات الصورة من",
        );
      }

      return {
        "imageUrl": data["secure_url"] as String,
        "publicId": data["public_id"] as String,
      };
    } catch (e) {
      rethrow;
    }
  }

  ///  Save to Firestore
 Future<void> saveimage(
    String imageUrl,
    String publicId,
    String userid,
  ) async {
    try {
      final url = Uri.parse("${AppLinkurl.link}/update-userprofile-image");

      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "userId": userid,
          "imageUrl": imageUrl,
          "publicId": publicId,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode != 200 || data["success"] != true) {
        throw ApiErorr(message: data["message"] ?? "فشل تغيير صورة البروفايل");
      }
    } catch (e) {
      if (e is ApiErorr) {
        rethrow;
      }

      throw ApiErorr(message: e.toString());
    }
  }


  Future<UserModel?> getuserdata(iddoc) async {
    try {
      final respons = await FirebaseFirestore.instance
          .collection("users")
          .doc(iddoc)
          .get();
      if (respons.exists) {
        final data = UserModel.fromMap(respons.data()!);
        return data;
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
    return null;
  }

  Future<void> updatauser(UserModel data, String userid) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userid)
          .update(data.toMap());
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionHandler.handleError(e);
    } on ApiErorr {
      rethrow;
    } catch (e) {
      throw ApiErorr(message: e.toString());
    }
  }

}
