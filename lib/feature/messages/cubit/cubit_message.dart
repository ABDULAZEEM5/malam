import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malam/feature/messages/cubit/status_message.dart';
import 'package:malam/feature/messages/data/repo_message.dart';

class CubitMessage extends Cubit<MessageState> {
  CubitMessage() : super(MessageInitial());
  RepoMessage repoMessage = RepoMessage();
 
  final String senderid = FirebaseAuth.instance.currentUser?.uid ?? '';
  Future<void> sendMessage(String message, String orderId) async {
    try {
      emit(SendMessageLoading());
      await repoMessage.sendMessage(
        message: message,
        senderId: senderid,
        orderId: orderId,
      );
      emit(SendMessageSuccess());
    } catch (e) {
      emit(SendMessageErorr(message: e.toString()));
    }
  }

  
}
