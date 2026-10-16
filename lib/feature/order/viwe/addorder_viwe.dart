import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/core/constans/sudancities.dart';
import 'package:malam/feature/home/cubit/home_cubit.dart';
import 'package:malam/feature/home/cubit/status.dart';
import 'package:malam/feature/order/cubit/cubit_order.dart';
import 'package:malam/feature/order/cubit/status.dart';
import 'package:malam/feature/order/widget/custom_dropdownfield.dart';
import 'package:malam/feature/order/widget/custom_textfiled.dart';
import 'package:malam/root.dart';
import 'package:malam/sheard/custm_showsnakbar.dart';
import 'package:malam/sheard/custom_buttom.dart';
import 'package:malam/sheard/custom_text.dart';

class AddorderViwe extends StatefulWidget {
  final String? craftsmanid;
  // final String? service;
  // final String? address;
  const AddorderViwe({super.key, this.craftsmanid});

  @override
  State<AddorderViwe> createState() => _AddorderViweState();
}

class _AddorderViweState extends State<AddorderViwe> {
  String? selectedService;
  String? selectedaddress;
  TextEditingController discontroller = TextEditingController();
  //TextEditingController addresscontroller = TextEditingController();

  GlobalKey<FormState> formstat = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // selectedService = widget.service!;
    // selectedaddress = widget.address!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Appcolor.backgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Appcolor.backgroundColor,
          centerTitle: true,
          title: CustomText(
            text: "طلب خدمة",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Form(
          key: formstat,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: BlocConsumer<CubitOrder, OrderStatus>(
              listener: (context, state) async {
                if (state is OrderSuccess) {
                  customshoSnackBar(
                    context,
                    "تم طلب الخدمة بنجاح سيتم مراجعة طلبك والتواصل معك من قبل الفني قريبًا.",
                    Appcolor.green,
                  );
                  await context.read<CubitOrder>().getorder();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Root(intiailaIndex: 1)),
                  );
                }
                if (state is OrderErorr) {
                  customshoSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                final cubit = context.read<CubitOrder>();
                return ListView(
                  children: [
                    Center(
                      child: CustomText(
                        text: "اخبرنا عن مشكلتك",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(20),

                    BlocBuilder<CubitHome, HomeStatus>(
                      builder: (context, state) {
                        final cubitservice = context.read<CubitHome>();
                        return CustomDropdownfield(
                          items: cubitservice.services
                              .map((i) => i!.name)
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedService = value;
                            });
                          },
                          title: "اختر الخدمة",
                          hint: "نوع الخدمة",
                        );
                      },
                    ),

                    Gap(35),
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: CustomText(
                        text: "وصف المشكلة",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(10),
                    CustomOrderTextfiled(
                      controller: discontroller,
                      hinttext: "وصف المشكة",
                    ),
                    Gap(30),
                    CustomDropdownfield(
                      items: sudanCities,
                      onChanged: (value) {
                        setState(() {
                          selectedaddress = value!;
                        });
                      },
                      title: 'العنوان',
                      hint: "اختر العنوان",
                    ),
                    Gap(10),

                    Gap(30),
                    state is OrderLoading
                        ? CupertinoActivityIndicator()
                        : CustomButtomTec(
                            text: "ارسال الطلب",
                            height: 50,
                            onPressed: () async {
                              if (selectedService == null ||
                                  selectedService!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Center(
                                      child: CustomText(
                                        color: Appcolor.backgroundColor,
                                        text: "الرجاء اختيار الخدمة",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                                return;
                              }
                              if (selectedaddress == null ||
                                  selectedaddress!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Center(
                                      child: CustomText(
                                        color: Appcolor.backgroundColor,
                                        text: "الرجاء اختيار العنوان",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                                return;
                              }
                              if (formstat.currentState!.validate()) {
                                await cubit.order(
                                  selectedService!,
                                  selectedaddress!,
                                  discontroller.text,
                                  widget.craftsmanid ?? "",
                                );
                              }
                            },
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
