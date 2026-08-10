import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/auth/cubit/cubit_profile.dart';
import 'package:malam/feature/auth/cubit/status_auth.dart';
import 'package:malam/root.dart';
import 'package:malam/sheard/custm_showsnakbar.dart';
import 'package:malam/sheard/custom_buttom.dart';

class UploadProfileImage extends StatelessWidget {
  final File? imageFile;
  const UploadProfileImage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: BlocConsumer<CubitProfile, AuthStatus>(
        listener: (context, state) {
          if (state is ProfileSuccess) {
            customshoSnackBar(context, "the image is successfluy uploading");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Root(intiailaIndex: 0)),
            );
          }
          if (state is ProfileErorr) {
            customshoSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CubitProfile>();

          return Center(
            child: Stack(
              children: [
                InteractiveViewer(child: Image.file(imageFile!)),

                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 20,
                  child: Center(
                    child: Row(
                      spacing: 50,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButtomTec(
                          text: "تراجع",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          height: 50,
                          width: 150,
                        ),
                        state is ProfileLoading == true
                            ? CupertinoActivityIndicator(
                                color: Appcolor.primaryColor,
                              )
                            : CustomButtomTec(
                                text: "رفع ",
                                onPressed: () async {
                                  if (cubit.imageFile == null) {
                                    customshoSnackBar(
                                      context,
                                      "اختر صورة أولاً",
                                    );
                                    return;
                                  }

                                  final imageUrl = await cubit.uploadImage(
                                    cubit.imageFile!,
                                  );
                                  await cubit.saveimage(imageUrl);
                                  cubit.getuserdata();
                                },
                                height: 50,
                                width: 150,
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
