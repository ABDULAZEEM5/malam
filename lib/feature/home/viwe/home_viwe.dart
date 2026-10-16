import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/auth/cubit/cubit_profile.dart';
import 'package:malam/feature/auth/cubit/status_auth.dart';
import 'package:malam/feature/home/cubit/home_cubit.dart';
import 'package:malam/feature/home/cubit/status.dart';
import 'package:malam/feature/home/viwe/notification_viwe.dart';
import 'package:malam/feature/home/viwe/services_details.dart';
import 'package:malam/feature/home/widget/card_service.dart';
import 'package:malam/feature/home/widget/card_techincal.dart';
import 'package:malam/feature/home/widget/custom_textfiled.dart';
import 'package:malam/feature/technical/cubit/cubit_technical.dart';
import 'package:malam/feature/technical/cubit/status.dart';
import 'package:malam/feature/technical/viwe/details_viwe.dart';
import 'package:malam/feature/technical/viwe/technical_viwe.dart';
import 'package:malam/sheard/custom_appbar.dart';
import 'package:malam/sheard/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController controller = TextEditingController();
  // String? name;
  // String? address;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<CubitProfile>().getuserdata();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Appcolor.backgroundColor,
        body: SafeArea(
          child: BlocBuilder<CubitHome, HomeStatus>(
            builder: (context, state) {
              final cubit = context.read<CubitHome>();
              return Skeletonizer(
                enabled: state is HomeLoading,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<CubitProfile, AuthStatus>(
                        builder: (context, state) {
                          final cubitpro = context
                              .read<CubitProfile>()
                              .userModel;
                          String name = cubitpro?.name ?? "عبدالعظيم";
                          String address =
                              cubitpro?.address ?? "العراق,الانبار";
                          return Column(
                            children: [
                              CustomAppbar(
                                text: address,
                                onPressednotif: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => NotificationViwe(),
                                    ),
                                  );
                                },
                              ),
                              const Gap(10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: CustomText(
                                  text: "السلام عليكم، $name",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      const Gap(15),
                      CustomTextfiled(controller: controller),
                      const Gap(20),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          text: "الخدمات",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(10),
                      Flexible(
                        child: GridView.builder(
                          itemCount: cubit.services.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1,
                                childAspectRatio: .95,
                              ),
                          itemBuilder: (context, i) {
                            return ServiceCard(services: cubit.services[i]);
                          },
                        ),
                      ),

                      Gap(10),
                      Row(
                        children: [
                          Gap(10),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TechnicalViwe(),
                              ),
                            ),
                            child: CustomText(
                              color: Appcolor.secondaryColor,
                              text: "عرض الكل",
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Spacer(),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: CustomText(
                              text: "الفنيون الاقرب اليك",
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Gap(5),
                      BlocBuilder<CubitTechnical, TechnicalStatus>(
                        builder: (context, state) {
                          final cubit = context.read<CubitTechnical>();
                          return cubit.onemodletechnicl == null
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Appcolor.secondaryColor,
                                  ),
                                )
                              : CustomCardTechincal(
                                  name: cubit.onemodletechnicl?.name ?? "",
                                  title: cubit.onemodletechnicl?.service ?? "",
                                  rota: cubit.onemodletechnicl?.rota ?? "",
                                  image: cubit.onemodletechnicl?.image ?? "",
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TechincalDetails(
                                        workerimages: cubit
                                            .onemodletechnicl!
                                            .workerimages,
                                        craftsmanid: cubit.onemodletechnicl!.id,
                                        image: cubit.onemodletechnicl!.image,
                                        name: cubit.onemodletechnicl!.name,
                                        descr:
                                            cubit.onemodletechnicl!.description,
                                        title: cubit.onemodletechnicl!.service,
                                        city: cubit.onemodletechnicl!.address,
                                        rota: cubit.onemodletechnicl!.rota,
                                        experience:
                                            cubit.onemodletechnicl!.experience,
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
