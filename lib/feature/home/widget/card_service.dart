import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/home/data/modle_home.dart';
import 'package:malam/sheard/custom_text.dart';

class ServiceCard extends StatelessWidget {
  final  ModleHome? services;

  const ServiceCard({super.key,required this.services});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {},
      child: Card(
        elevation: 5,

        color: Appcolor.greyColor,
        shadowColor: Colors.black.withValues(alpha: .12),
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Appcolor.primaryColor.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Appcolor.primaryColor.withValues(alpha: .70),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    services!.icon,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      Appcolor.secondaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomText(
                text: services!.name,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:malam/core/constans/appcolor.dart';
// import 'package:malam/feature/home/data/testdata.dart';
// import 'package:malam/sheard/custom_text.dart';

// class ServiceCard extends StatelessWidget {
//   final Service service;

//   const ServiceCard({
//     super.key,
//     required this.service,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       borderRadius: BorderRadius.circular(15),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(15),
//         onTap: () {
//           // TODO: Navigate to service page
//         },
//         child: Card(
//           elevation: 4,
//           color: Appcolor.greyColor,
//           shadowColor: Colors.black.withOpacity(0.10),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: 16,
//               horizontal: 8,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 62,
//                   width: 62,
//                   decoration: BoxDecoration(
//                     color: Appcolor.primaryColor.withOpacity(0.12),
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Appcolor.primaryColor.withOpacity(0.20),
//                         blurRadius: 10,
//                         spreadRadius: 1,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Center(
//                     child: SvgPicture.asset(
//                       service.image,
//                       height: 30,
//                       colorFilter: ColorFilter.mode(
//                         Appcolor.primaryColor,
//                         BlendMode.srcIn,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 CustomText(
//                   text: service.name,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
                 
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
