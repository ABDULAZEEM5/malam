import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/auth/cubit/cubit_profile.dart';
import 'package:malam/feature/auth/cubit/status_auth.dart';
import 'package:malam/feature/auth/viwe/profile/about_appviwe.dart';
import 'package:malam/feature/auth/viwe/profile/updata_profileviwe.dart';
import 'package:malam/feature/auth/viwe/signin.dart';
import 'package:malam/feature/auth/widget/Custom_profileimage.dart';
import 'package:malam/feature/auth/widget/custom_profiletem.dart';
import 'package:malam/feature/order/viwe/order_historyviwe.dart';
import 'package:malam/sheard/custom_buttom.dart';
import 'package:malam/sheard/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileViwe extends StatelessWidget {
  const ProfileViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: RefreshIndicator(
            onRefresh: () => context.read<CubitProfile>().getuserdata(),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const Gap(25),

                // Profile Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Appcolor.primaryColor.withValues(alpha: .10),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: BlocBuilder<CubitProfile, AuthStatus>(
                    builder: (context, state) {
                      final cubit = context.read<CubitProfile>();
                      // final loading = state is AuthLoading==true;
                      return Skeletonizer(
                        enabled: cubit.userModel == null,
                        child: Column(
                          children: [
                            CustomProfileimage(
                              backgroundImage: NetworkImage(
                                (cubit.userModel?.imageUrl == null ||
                                        cubit.userModel!.imageUrl!.isEmpty)
                                    ? "https://picsum.photos/200"
                                    : cubit.userModel!.imageUrl!,
                              ),

                              onPressed: () {
                                cubit.pickImage(context);
                              },
                            ),

                            const Gap(15),

                            CustomText(
                              text: cubit.userModel?.name ?? "عبدالعظيم جبريل",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),

                            const Gap(5),

                            CustomText(
                              text:
                                  "${FirebaseAuth.instance.currentUser!.email}",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const Gap(25),

                // Settings Menu
                Container(
                  decoration: BoxDecoration(
                    color: Appcolor.primaryColor.withValues(alpha: .08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      CustomProfileitem(
                        onTap: () {},
                        icon: Icons.location_on_outlined,
                        title: "العنوان",
                      ),

                      _divider(),

                      CustomProfileitem(
                        onTap: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OrderHistoryviwe(),
                            ),
                          );
                        },
                         icon: Icons.receipt_long_outlined,
                        title: "سجل الطلبات"
                      ),

                      _divider(),

                      CustomProfileitem(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => UpdataProfiledataViwe(),
                            ),
                          );
                        },
                        icon: Icons.settings_outlined,
                        title: "الإعدادات",
                      ),

                      _divider(),

                      CustomProfileitem(
                        onTap: () {},
                        icon: Icons.help_outline,
                        title: "مساعدة",
                      ),

                      _divider(),

                      CustomProfileitem(
                        onTap: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AboutAppPage(),
                            ),
                          );
                        },
                        icon: Icons.info_outline,
                        title: "عن التطبيق",
                      ),
                    ],
                  ),
                ),
                const Gap(25),
                CustomButtomTec(
                  text: "خروج من التطبيق",
                  backgroundColor: Colors.red,
                  height: 45,
                  // foregroundColor: Colors.redAccent,
                   onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SigninViwe()));
                  },
                ),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      thickness: .5,
      indent: 20,
      endIndent: 20,
      color: Colors.grey.withOpacity(.3),
    );
  }
}
