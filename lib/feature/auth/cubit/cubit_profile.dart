import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/feature/auth/cubit/status_auth.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:malam/feature/auth/data/repo_profile.dart';
import 'package:malam/feature/auth/data/user_model.dart';
import 'package:malam/feature/auth/viwe/profile/upload_profileimage.dart';

class CubitProfile extends Cubit<AuthStatus> {
  CubitProfile() : super(AuthInitial());
  String get user => FirebaseAuth.instance.currentUser!.uid;
  RepoProfile repoProfile = RepoProfile();

  final picker = ImagePicker();
  File? imageFile;
  UserModel? userModel;
  UserImageModel? userimageModel;
  
  Future<void> pickImage(context) async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => UploadProfileImage(imageFile: imageFile),
        ),
      );
    }
  }

  Future<String> uploadImage(File file) async {
    try {
      emit(ProfileLoading());

      final imageUrl = await repoProfile.uploadImage(file);

      emit(ProfileSuccess());

      return imageUrl;
    } catch (e) {
      String message = "حدث خطأ";

      if (e is http.ClientException) {
        message = "تحقق من اتصال الإنترنت";
      } else if (e is ApiErorr) {
        message = e.message;
      }

      emit(ProfileErorr(message));
      rethrow;
    }
  }

  Future saveimage(String imageUrl) async {
    try {
      final userid = user;
      emit(ProfileLoading());
      await repoProfile.saveimage(imageUrl, userid);
      emit(ProfileSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(ProfileErorr(message));
    }
  }

  Future getuserdata() async {
    try {
      emit(ProfileLoading());
      final data = await repoProfile.getuserdata(user);
      userModel = data;
      emit(ProfileSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(ProfileErorr(message));
    }
  }

  Future updatauserdata(
    String username,
    String useradrrss,
    String userphone,
  ) async {
    emit(ProfileLoading());
    try {
      final userid = user;
      await repoProfile.updatauser(
        UserModel(name: username, address: useradrrss, phone: userphone),
        userid,
      );
      emit(ProfileSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(ProfileErorr(message));
    }
  }
}
