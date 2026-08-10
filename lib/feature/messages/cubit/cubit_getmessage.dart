import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/feature/messages/cubit/status_message.dart';
import 'package:malam/feature/messages/data/repo_message.dart';

class CubitGetmessage extends Cubit<MessageState> {
  CubitGetmessage() : super(MessageInitial());
  RepoMessage repoMessage = RepoMessage();
  StreamSubscription? _messageSubscription;
  void getMessage(String orderId) {
    // emit(GetMessageLoading());
    _messageSubscription?.cancel();
    _messageSubscription = repoMessage
        .getMessage(orderId: orderId)
        .listen(
          (messages) {
            emit(GetMessageSuccess(messages: messages));
            final currentuser = FirebaseAuth.instance.currentUser!.uid;
            final hasUnreadMessage = messages.any(
              (m) => !m.isRead && m.senderId != currentuser,
            );
            if (hasUnreadMessage) {
              markMessagesAsRead(orderId);
            }
          },
          onError: (error) {
            emit(GetMessageErorr(message: error.toString()));
          },
        );
  }

  Future<void> markMessagesAsRead(String orderId) async {
    try {
      await repoMessage.markMessagesAsRead(orderId);
    } catch (e) {
      if (e is ApiErorr) {}
    }
  }

  @override
  Future<void> close() async {
    await _messageSubscription?.cancel();
    return super.close();
  }
}
