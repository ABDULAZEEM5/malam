import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';

class CustomBottomNavBar extends StatelessWidget {
  final void Function(int)? onTap;
  final int currentpage;
  const CustomBottomNavBar({super.key, this.onTap, required this.currentpage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.vertical(
          top: Radius.circular(30),
          bottom: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Appcolor.secondaryColor,
          unselectedItemColor: Appcolor.primaryColor,
          backgroundColor: Appcolor.primaryColor.withValues(alpha: .35),
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          currentIndex: currentpage,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'الملف الشخصي',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp, size: 30),
              label: 'طلباتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, size: 30),
              label: 'اضافة طلب',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'رئيسية',
            ),
          ],
        ),
      ),
    );
  }
}
