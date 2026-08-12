import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/technical/data/modle_technical.dart';

class ImagesWorke extends StatelessWidget {
  final List<ImgesWorkerModle> images;

  const ImagesWorke({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(top: 7),
            height: 300,
            color: Appcolor.secondaryColor,
            child: Image.network(
              images[i].imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 50,
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}