import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malam/feature/auth/viwe/profile/profile_viwe.dart';
import 'package:malam/feature/checkinternet/cubit/cubit_checkinternet.dart';
import 'package:malam/feature/checkinternet/viwe/nointernetpage.dart';
import 'package:malam/feature/home/viwe/home_viwe.dart';
import 'package:malam/feature/order/viwe/addorder_viwe.dart';
import 'package:malam/feature/order/viwe/order_currentviwe.dart';
import 'package:malam/sheard/custom_bottom_navbar.dart';

class Root extends StatefulWidget {
  final int intiailaIndex;
  const Root({super.key, this.intiailaIndex = 3});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  List<Widget> pages = [
    ProfileViwe(),
    OrderCurrntviwe(),
    AddorderViwe(),
    HomeView(),
  ];
  PageController? controller;
  late int currentIndex;
  @override
  void initState() {
    currentIndex = widget.intiailaIndex;
    controller = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,

      body: Stack(
        children: [
          PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),
          BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state == InternetState.disconnected) {
                return const Positioned.fill(child: NoInternetPage());
              }

              return const SizedBox();
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentpage: currentIndex,
        onTap: (v) {
          setState(() {
            currentIndex = v;
            controller!.jumpToPage(v);
          });
        },
      ),
    );
  }
}
