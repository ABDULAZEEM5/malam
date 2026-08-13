import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/auth/cubit/cubit_auth.dart';
import 'package:malam/feature/auth/cubit/status_auth.dart';
import 'package:malam/feature/auth/viwe/signin.dart';
import 'package:malam/feature/auth/widget/custom_buttom.dart';
import 'package:malam/feature/auth/widget/custom_textfiled.dart';
import 'package:malam/root.dart';
import 'package:malam/sheard/custm_showsnakbar.dart';
import 'package:malam/sheard/custom_text.dart';

class PasswordResetEmailViwe extends StatefulWidget {
  const PasswordResetEmailViwe({super.key});

  @override
  State<PasswordResetEmailViwe> createState() => _PasswordResetEmailViweState();
}

class _PasswordResetEmailViweState extends State<PasswordResetEmailViwe> {
  final emailController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Appcolor.primaryColor, Appcolor.backgroundColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: BlocConsumer<CubitAuth, AuthStatus>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SigninViwe()),
                  );
                   customshoSnackBar(
                    context,
                    "تم ارسال رابط اعادة تعيين كلمة المرور الي بريدك الالكتروني",
                    Appcolor.green,
                  );
                }
                if (state is AuthErorr) {
                  customshoSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                final loading = state is AuthLoading == true;
                final cubit = context.read<CubitAuth>();

                return Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Image.asset('assets/logo/logo.png', height: 180),
                        const CustomText(
                          text: "مرحباً بك",
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        const Gap(8),
                        const CustomText(
                          text: "ادخل الايميل لاعادة تعيين كلمة السر",
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.normal,
                        ),
                        const Gap(35),

                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Form(
                            key: formState,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: emailController,
                                  labelText: "البريد الإلكتروني",
                                  isPassword: false,
                                ),

                                const Gap(20),

                                loading
                                    ? CupertinoActivityIndicator(
                                        color: Appcolor.primaryColor,
                                      )
                                    : SizedBox(
                                        width: double.infinity,
                                        child: CustomButtom(
                                          text: "اعادة تعيين كلمة المرور",
                                          onTap: () {
                                            if (formState.currentState!
                                                .validate()) {
                                              cubit.sendPasswordResetEmail(
                                                emailController.text.trim(),
                                              );
                                            }
                                          },
                                        ),
                                      ),

                                const Gap(15),
                              ],
                            ),
                          ),
                        ),
                        const Gap(150),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
