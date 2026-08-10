import 'package:malam/feature/messages/data/modle.dart';

abstract class MessageState {}

class MessageInitial extends MessageState {}

class SendMessageLoading extends MessageState {}

class SendMessageSuccess extends MessageState {}

class SendMessageErorr extends MessageState {
  final String message;
  SendMessageErorr({required this.message});
}


class GetMessageLoading extends MessageState {}

class GetMessageSuccess extends MessageState {
  final List<MessageModel> messages;
  GetMessageSuccess({required this.messages});
}

class GetMessageErorr extends MessageState {
  final String message;
  GetMessageErorr({required this.message});
}


class ReadMessageLoading extends MessageState {}

class ReadMessageSuccess extends MessageState {}

class ReadMessageErorr extends MessageState {
  final String message;
  ReadMessageErorr({required this.message});
}