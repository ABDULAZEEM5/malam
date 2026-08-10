import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/messages/viwe/chatscreen_viwe.dart';
import 'package:malam/feature/order/data/model_order.dart';
import 'package:malam/feature/order/widget/orderstatus_text.dart';
import 'package:malam/sheard/custom_buttom.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomCardorder extends StatelessWidget {
  final ModelOrder order;
  final int remoeid;
  const CustomCardorder({
    super.key,
    required this.order,
    required this.remoeid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 3,
        shadowColor: Appcolor.primaryColor.withValues(alpha: .3),
        color: Appcolor.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: order.orderid,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: getStatusColor(order.orderstatus),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          getStatusIcon(order.orderstatus),
                          color: Colors.white,
                          size: 15,
                        ),
                        const Gap(4),
                        CustomText(
                          text: order.orderstatus,
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Gap(15),

              Divider(color: Appcolor.greywhiteColor),

              const Gap(10),

              orderInfo(title: "الخدمة", value: order.service),

              orderInfo(title: "الموقع", value: order.address),

              orderInfo(
                title: "التاريخ",
                value: DateFormat(
                  ' aHH:mm  yyyy-MM-dd',
                ).format(order.timecreated.toDate()),
              ),
              Gap(10),
              if (order.orderstatus != OrderStatusText.pending)
                CustomButtomTec(
                  text: 'مراسلة',
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreenViwe(orderId: order.orderid),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget orderInfo({required String title, required String value}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title, fontSize: 14, fontWeight: FontWeight.bold),
        CustomText(
          text: value,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey[700],
        ),
      ],
    ),
  );
}
