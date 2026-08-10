import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/auth/cubit/cubit_auth.dart';
import 'package:malam/feature/auth/cubit/status_auth.dart';
import 'package:malam/feature/auth/viwe/signup.dart';
import 'package:malam/feature/auth/widget/custom_buttom.dart';
import 'package:malam/feature/auth/widget/custom_textfiled.dart';
import 'package:malam/root.dart';
import 'package:malam/sheard/custm_showsnakbar.dart';

class SigninViwe extends StatefulWidget {
  const SigninViwe({super.key});

  @override
  State<SigninViwe> createState() => _SigninViweState();
}

class _SigninViweState extends State<SigninViwe> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                    MaterialPageRoute(builder: (_) => Root()),
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
                        const Text(
                          "مرحباً بك",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Gap(8),
                        const Text(
                          "سجل دخولك لطلب أفضل الخدمات",
                          style: TextStyle(fontSize: 16, color: Colors.white70),
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

                                CustomTextField(
                                  controller: passwordController,
                                  labelText: "كلمة المرور",
                                  isPassword: true,
                                ),

                                const Gap(10),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "نسيت كلمة المرور؟",
                                      style: TextStyle(
                                        color: Appcolor.primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),

                                const Gap(10),

                                loading
                                    ? CupertinoActivityIndicator(
                                        color: Appcolor.primaryColor,
                                      )
                                    : SizedBox(
                                        width: double.infinity,
                                        child: CustomButtom(
                                          text: "تسجيل الدخول",
                                          onTap: () {
                                            if (formState.currentState!
                                                .validate()) {
                                              cubit.signin(
                                                emailController.text.trim(),
                                                passwordController.text.trim(),
                                              );
                                            }
                                          },
                                        ),
                                      ),

                                const Gap(15),

                                SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => SignUpViwe(),
                                        ),
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Appcolor.primaryColor,
                                      side: BorderSide(
                                        color: Appcolor.primaryColor,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text(
                                      "إنشاء حساب",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
