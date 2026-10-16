import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/order/viwe/addorder_viwe.dart';
import 'package:malam/root.dart';
import 'package:malam/sheard/custom_text.dart';

class ServicesDetails extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  const ServicesDetails({
    super.key,
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Appcolor.primaryColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'تفاصيل الخدمة',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة الخدمة
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SvgPicture.asset(
                    image,
                    alignment: AlignmentGeometry.center,
                    width: double.infinity,
                    height: 230,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 230,
                        width: double.infinity,
                        color: Colors.grey.shade100,
                        child: const Icon(
                          Icons.image_outlined,
                          size: 55,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // اسم الخدمة
              Text(
                name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.primaryColor,
                ),
              ),

              const SizedBox(height: 12),

              // وصف الخدمة
              CustomText(
                text: description,
                fontSize: 14,
                maxLines: 3,
                fontWeight: FontWeight.w600,
              ),

              const SizedBox(height: 24),

              // مميزات الخدمة
              _buildFeature(Icons.verified_outlined, 'خدمة عالية الجودة'),

              const SizedBox(height: 14),

              _buildFeature(Icons.access_time, 'مواعيد مرنة تناسبك'),

              const SizedBox(height: 14),

              _buildFeature(Icons.support_agent, 'دعم ومساعدة مستمرة'),

              const SizedBox(height: 32),

              // زر حجز الخدمة
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Root(intiailaIndex: 2,)),(route) => false,);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolor.secondaryColor,
                    foregroundColor: Appcolor.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'اطلب الخدمة الآن',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildFeature(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.amber.shade700, size: 22),
        const SizedBox(width: 12),
        CustomText(text: title, fontSize: 15, fontWeight: FontWeight.w500),
      ],
    );
  }
}
