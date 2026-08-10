import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomCardTec extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  final String city;
  final String rota;
  final Function()? onTap;
  const CustomCardTec({
    super.key,
    required this.image,
    required this.name,
    required this.title,
    required this.city,
    required this.rota,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Appcolor.secondaryColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Technician Image
              image.isNotEmpty
                  ? Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person,size: 150,),
                    )
                  : const Icon(Icons.person,size: 150,),

              // Dark overlay
              Container(color: Colors.black.withValues(alpha: 0.15)),

              // Bottom Information
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Appcolor.primaryColor.withValues(alpha: 0.85),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: name,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      const SizedBox(height: 4),
                      CustomText(
                        text: title,
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Appcolor.secondaryColor,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          CustomText(
                            text: rota,
                            color: Appcolor.backgroundColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          Spacer(),
                          Icon(
                            Icons.location_on,
                            color: Appcolor.backgroundColor,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          CustomText(
                            text: city,
                            color: Appcolor.backgroundColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
