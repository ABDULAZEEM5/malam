import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/technical/widget/custom_bottomicon.dart';
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
  const TechincalDetails({
    super.key,
    required this.image,
    required this.name,
    required this.descr,
    required this.title,
    required this.city,
    required this.rota,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// Cover Image
          SizedBox(
            height: 330,
            width: double.infinity,
            child: image.isNotEmpty
                ? Image.network(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person,size:150,),
                  )
                : const Icon(Icons.person,size: 150,),
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
              height: MediaQuery.of(context).size.height * .62,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const Gap(20),

                  Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const Gap(8),

                  Center(
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),

                  const Gap(20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Chip(
                        label: CustomText(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          text: "خبرة $experience سنوات",
                        ),
                      ),
                      Chip(
                        avatar: Icon(Icons.location_on, size: 18),
                        label: CustomText(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          text: city,
                        ),
                      ),
                    ],
                  ),

                  const Gap(25),

                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: CustomText(
                      text: "نبذة عني",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Gap(10),

                  CustomText(
                    text: descr,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtomTec(
                        backgroundColor: Appcolor.greywhiteColor,
                        foregroundColor: Appcolor.secondaryColor,
                        text: "مراسلة",
                        height: 50,
                        onPressed: () {},
                      ),

                      const Gap(15),
                      CustomButtomTec(
                        text: "طلب الخدمة",
                        onPressed: () {},
                        width: 170,
                        height: 50,
                      ),
                    ],
                  ),
                  const Gap(35),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
