import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/technical/data/modle_technical.dart';
import 'package:malam/feature/technical/viwe/images_worke.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomImages extends StatelessWidget {
  final List<ImgesWorkerModle> images;
  const CustomImages({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            images.length > 3
                ? GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_)=>ImagesWorke(images: images,)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_back_ios_new,
                          size: 13,
                          color: Appcolor.secondaryColor,
                        ),
                        Text(
                          "عرض الكل",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Appcolor.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            Row(
              children: [
                Container(
                  width: 4,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Appcolor.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 8),

                const CustomText(
                  text: "صور من أعمالي",
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Images
        if (images.isEmpty)
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8FA),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xffE8E9ED)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_library_outlined,
                  size: 35,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 8),
                Text(
                  "لا توجد صور لأعمال الفني",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          )
        else
          SizedBox(
            height: 125,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: images.length > 3 ? 3 : images.length,
              itemBuilder: (context, index) {
                final bool isLastVisibleImage = index == 2 && images.length > 3;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      // Image
                      Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.08),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            images[index].imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Appcolor.greywhiteColor,
                                child: Center(
                                  child: Icon(
                                    Icons.broken_image_outlined,
                                    size: 32,
                                    color: Appcolor.secondaryColor,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // Overlay for more images
                      if (isLastVisibleImage)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.48),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.photo_library_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "+${images.length - 2} صور",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
