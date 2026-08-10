import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomCardTechincal extends StatelessWidget {
  final String name;
  final String image;
  final String title;
  final String rota;
  final VoidCallback? onPressed;

  const CustomCardTechincal({
    super.key,
    required this.name,
    required this.image,
    required this.title,
    required this.rota,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Appcolor.primaryColor.withValues(alpha: .9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 42,
                backgroundImage:
                    image.isNotEmpty ? NetworkImage(image) : null,
                child: image.isEmpty
                    ? const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      )
                    : null,
              ),
            ),

            const Gap(20),

            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: name,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.backgroundColor,
                     
                    ),

                    const Gap(6),

                    Center(
                      child: CustomText(
                        text: title,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                                         
                      ),
                    ),

                    const Gap(10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const Gap(4),
                        CustomText(
                          text: rota,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Appcolor.backgroundColor,
                        ),
                        const Gap(6),
                        const CustomText(
                          text: "تقييم",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ],
                    ),

                    const Gap(18),

                    Center(
                      child: SizedBox(
                        width: 110,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolor.secondaryColor,
                            foregroundColor: Appcolor.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const CustomText(
                            text: "عرض",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Appcolor.primaryColor,
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
  }
}