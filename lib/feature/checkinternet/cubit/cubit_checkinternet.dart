import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

enum InternetState { connected, disconnected }

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? subscription;

  InternetCubit() : super(InternetState.connected) {
    subscription = InternetConnection().onStatusChange.listen((status) {
      if (status == InternetStatus.connected) {
        emit(InternetState.connected);
      } else {
        emit(InternetState.disconnected);
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();

    return super.close();
  }
}
