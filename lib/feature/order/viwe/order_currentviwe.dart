import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/order/cubit/cubit_order.dart';
import 'package:malam/feature/order/cubit/status.dart';
import 'package:malam/feature/order/widget/custom_cardorder.dart';
import 'package:malam/sheard/custom_text.dart';

class OrderCurrntviwe extends StatefulWidget {
  const OrderCurrntviwe({super.key});

  @override
  State<OrderCurrntviwe> createState() => _OrderCurrntviweState();
}

class _OrderCurrntviweState extends State<OrderCurrntviwe> {
  @override
  void initState() {
   context.read<CubitOrder>().getorder();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: RefreshIndicator(
          onRefresh: () => context.read<CubitOrder>().getorder(),
          child: Scaffold(
        backgroundColor: Appcolor.backgroundColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Appcolor.backgroundColor,
          centerTitle: true,
          title: CustomText(
            text: "طلباتي",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: BlocBuilder<CubitOrder, OrderStatus>(
            builder: (context, state) {
              final cubit = context.read<CubitOrder>();
              if (state is GetOrderLoading) {
                return const Center(child: CupertinoActivityIndicator());
              }

              if (cubit.ordermodle.isEmpty) {
                return const Center(
                  child: CustomText(
                    text: "لا توجد طلبات",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: cubit.ordermodle.length,
                itemBuilder: (context, i) {
                  final order = cubit.ordermodle[i];
                  return CustomCardorder(order: order,remoeid: i,);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
