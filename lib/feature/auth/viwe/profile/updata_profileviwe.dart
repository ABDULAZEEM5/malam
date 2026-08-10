import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/auth/cubit/cubit_profile.dart';
import 'package:malam/feature/auth/cubit/status_auth.dart';
import 'package:malam/feature/auth/widget/custom_buttom.dart';
import 'package:malam/feature/auth/widget/custom_textfiled.dart';
import 'package:malam/root.dart';
import 'package:malam/sheard/custm_showsnakbar.dart';
import 'package:malam/sheard/custom_text.dart';

class UpdataProfiledataViwe extends StatefulWidget {
  const UpdataProfiledataViwe({super.key});

  @override
  State<UpdataProfiledataViwe> createState() => _UpdataProfiledataState();
}

class _UpdataProfiledataState extends State<UpdataProfiledataViwe> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final cubit = context.read<CubitProfile>();
    nameController.text = cubit.userModel!.name;
    addressController.text = cubit.userModel!.address;
    phoneController.text = cubit.userModel!.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Appcolor.backgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Appcolor.backgroundColor,
          centerTitle: true,
          title: CustomText(
            text: "تعديل البيانات",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: BlocListener<CubitProfile, AuthStatus>(
          listener: (context, state) {
            if (state is ProfileSuccess) {
              customshoSnackBar(context, "تم تعديل البيانات بنجاح");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Root(intiailaIndex: 0)),
              );
            }
            if (state is ProfileErorr) {
              customshoSnackBar(context, state.message);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Gap(100),
                  Form(
                    key: formState,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: nameController,
                          labelText: "الاسم",
                          isPassword: false,
                        ),

                        const Gap(20),

                        CustomTextField(
                          controller: addressController,
                          labelText: "العنوان",
                          isPassword: false,
                        ),

                        const Gap(20),
                        CustomTextField(
                          controller: phoneController,
                          labelText: "رقم الهاتف",
                          isPassword: false,
                          keyboardType: TextInputType.phone,
                        ),

                        const Gap(50),

                        BlocBuilder<CubitProfile, AuthStatus>(
                          builder: (context, state) {
                            final cubit = context.read<CubitProfile>();
                            return state is ProfileLoading == true
                                ? CupertinoActivityIndicator(
                                    color: Appcolor.primaryColor,
                                  )
                                : SizedBox(
                                    width: double.infinity,
                                    child: CustomButtom(
                                      text: "تعديل البيانات",
                                      onTap: () async {
                                        if (formState.currentState!
                                            .validate()) {
                                          await cubit.updatauserdata(
                                            nameController.text.trim(),
                                            addressController.text.trim(),
                                            phoneController.text.trim(),
                                          );
                                          cubit.getuserdata();
                                        }
                                      },
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
