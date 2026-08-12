import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/order/viwe/addorder_viwe.dart';
import 'package:malam/feature/technical/data/modle_technical.dart';
import 'package:malam/feature/technical/widget/custom_bottomicon.dart';
import 'package:malam/feature/technical/widget/custom_images.dart';
import 'package:malam/sheard/custom_buttom.dart';
import 'package:malam/sheard/custom_text.dart';

class TechincalDetails extends StatelessWidget {
  final String image;
  final String name;
  final String descr;
  final String title;
  final String city;
  final String rota;
  final String experience;
  final String craftsmanid;
  final List<ImgesWorkerModle>? workerimages;

  const TechincalDetails({
    super.key,
    required this.image,
    required this.name,
    required this.descr,
    required this.title,
    required this.city,
    required this.rota,
    required this.experience,
    required this.craftsmanid,
    required this.workerimages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      body: Stack(
        children: [
          /// Cover Image
          SizedBox(
            height: 460,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: image.isNotEmpty
                      ? Image.network(
                          image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Appcolor.greywhiteColor,
                                child: const Icon(
                                  Icons.person,
                                  size: 150,
                                  color: Colors.grey,
                                ),
                              ),
                        )
                      : Container(
                          color: Appcolor.greywhiteColor,
                          child: const Icon(
                            Icons.person,
                            size: 150,
                            color: Colors.grey,
                          ),
                        ),
                ),

                /// Dark gradient over image
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(.35),
                          Colors.transparent,
                          Colors.black.withOpacity(.35),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          CustomBottomicon(
            icon: Icons.arrow_back,
            top: 35,
            onPressed: () => Navigator.pop(context),
          ),

          CustomBottomicon(
            icon: Icons.favorite_border,
            top: 35,
            right: 0,
            onPressed: () {},
          ),

          /// Details Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .67,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.10),
                    blurRadius: 25,
                    offset: const Offset(0, -8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top handle
                  Center(
                    child: Container(
                      width: 55,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xffD9DCE1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  const Gap(10),

                  /// Name
                  Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff202124),
                      ),
                    ),
                  ),

                  const Gap(6),

                  /// Job title
                  Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff858A91),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const Gap(10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: Appcolor.greywhiteColor,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.12),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.workspace_premium_outlined,
                              size: 19,
                              color: Appcolor.secondaryColor,
                            ),
                            const Gap(6),
                            CustomText(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              text: "خبرة $experience سنوات",
                            ),
                          ],
                        ),
                      ),

                      const Gap(12),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: Appcolor.greywhiteColor,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.12),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 19,
                              color: Appcolor.secondaryColor,
                            ),
                            const Gap(5),
                            CustomText(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              text: city,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Gap(20),

                  /// About title
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 4,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Appcolor.secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const Gap(8),
                        CustomText(
                          text: "نبذة عني",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),

                  const Gap(5),

                  /// Description
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xffF8F9FB),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: CustomText(
                        maxLines: 2,
                        text: descr,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),

                  const Gap(20),
                  CustomImages(images: workerimages!),

                  /// Buttons
                  const Spacer(),
                  Center(
                    child: CustomButtomTec(
                      text: "طلب الخدمة",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                AddorderViwe(craftsmanid: craftsmanid),
                          ),
                        );
                      },
                      width: 280,
                      height: 50,
                    ),
                  ),

                  const Gap(5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
