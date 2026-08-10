
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/home/cubit/notification_cubit.dart';
import 'package:malam/feature/home/cubit/status.dart';
import 'package:malam/sheard/custom_text.dart';

class NotificationViwe extends StatefulWidget {
  const NotificationViwe({super.key});

  @override
  State<NotificationViwe> createState() => _NotificationViweState();
}

class _NotificationViweState extends State<NotificationViwe> {
  @override
  void initState() {
    super.initState();
    context.read<CubitNotification>().getnotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Appcolor.backgroundColor,
        title: const CustomText(
          text: "الإشعارات",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocBuilder<CubitNotification, HomeStatus>(
        builder: (context, state) {
          final cubit = context.read<CubitNotification>();

          if (cubit.notifiction.isEmpty) {
            return const Center(
              child: CustomText(
                text: "لا يوجد اشعارات الان",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cubit.notifiction.length,
            itemBuilder: (context, index) {
              final notification = cubit.notifiction[index];

              // isRead نوعه bool
              final bool isRead = notification!.isRead;

              // createdAt نوعه Timestamp
              final String date =
                  notification.createdAt.toDate().toString();

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  elevation: isRead ? 1 : 3,
                  color: isRead
                      ? Appcolor.backgroundColor
                      : Colors.blue.withOpacity(.05),
                  shadowColor: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: isRead
                          ? Colors.transparent
                          : Colors.blue.withOpacity(.2),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: isRead
                              ? Colors.grey.withOpacity(.12)
                              : Colors.blue.withOpacity(.12),
                          child: Icon(
                            isRead
                                ? Icons.notifications_none
                                : Icons.notifications_active,
                            color: isRead ? Colors.grey : Colors.blue,
                            size: 26,
                          ),
                        ),

                        const Gap(14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  if (!isRead)
                                    Container(
                                      width: 8,
                                      height: 8,
                                      margin: const EdgeInsets.only(left: 6),
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),

                                  Expanded(
                                    child: CustomText(
                                      text: notification.title,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              const Gap(8),

                              CustomText(
                                text: notification.body,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),

                              const Gap(10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                  const Gap(4),
                                  CustomText(
                                    text: date,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

