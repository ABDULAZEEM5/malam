import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/messages/cubit/cubit_getmessage.dart';
import 'package:malam/feature/messages/cubit/cubit_message.dart';
import 'package:malam/feature/messages/cubit/status_message.dart';
import 'package:malam/feature/messages/widget/custom_bottomsend.dart';
import 'package:malam/sheard/custom_text.dart';

class ChatScreenViwe extends StatefulWidget {
  final String orderId;

  const ChatScreenViwe({super.key, required this.orderId});

  @override
  State<ChatScreenViwe> createState() => _ChatScreenViweState();
}

class _ChatScreenViweState extends State<ChatScreenViwe> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CubitGetmessage>().getMessage(widget.orderId);
   // context.read<CubitGetmessage>().markMessagesAsRead(widget.orderId);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Appcolor.backgroundColor,
        appBar: AppBar(
          backgroundColor: Appcolor.backgroundColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: const CustomText(
            text: "دردشة",
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: BlocBuilder<CubitGetmessage, MessageState>(
          builder: (context, state) {
            if (state is SendMessageLoading) {
              // return const Center(child: CircularProgressIndicator());
            }

            if (state is GetMessageSuccess) {
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 90),
                reverse: true,
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  final message =
                      state.messages[state.messages.length - 1 - index];

                  final isSender =
                      context.read<CubitMessage>().senderid == message.senderId;

                  return Align(
                    alignment: isSender
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 300),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSender
                            ? Appcolor.secondaryColor.withValues(alpha: .3)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Column(
                        crossAxisAlignment: isSender
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            text: message.text,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),

                          const Gap(5),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: DateFormat(
                                  'HH:mm',
                                ).format(message.createdAt.toDate()),
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                              ),

                              if (isSender) ...[
                                const Gap(5),
                                Icon(
                                  message.isRead ? Icons.done_all : Icons.done,
                                  size: 16,
                                  color: message.isRead
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            if (state is GetMessageErorr) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
        bottomSheet: BlocConsumer<CubitMessage, MessageState>(
          listener: (context, state) {
            controller.clear();
          },
          builder: (context, state) {
            return CustomBottomsend(
              controller: controller,
              onChanged: (_) => setState(() {}),
              onPressed: controller.text.trim().isEmpty
                  ? null
                  : () {
                      context.read<CubitMessage>().sendMessage(
                        controller.text.trim(),
                        widget.orderId,
                      );
                    },
            );
          },
        ),
      ),
    );
  }
}
