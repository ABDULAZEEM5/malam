import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/core/services/onesignal_service.dart';
import 'package:malam/feature/auth/cubit/status_auth.dart';
import 'package:malam/feature/auth/data/repo_auth.dart';

class CubitAuth extends Cubit<AuthStatus> {
  CubitAuth() : super(AuthInitial());

  Authrepo authrepo = Authrepo();

  Future signup(String email, String password) async {
    try {
      emit(AuthLoading());
      await authrepo.signup(email, password);
      emit(AuthSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(AuthErorr(message));
    }
  }

  Future signin(String email, String password) async {
    try {
      emit(AuthLoading());
      await authrepo.signin(email, password);
      await OneSignalService.init();
      emit(AuthSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(AuthErorr(message));
    }
  }

  Future sendPasswordResetEmail(String email) async {
    try {
      emit(AuthLoading());
      await authrepo.sendPasswordResetEmail(email);
      emit(AuthSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(AuthErorr(message));
    }
  }

  Future complitesignup(
    String username,
    String useraddress,
    String userphone,
  ) async {
    try {
      final user = FirebaseAuth.instance.currentUser!.uid;
      final userid = user;

      emit(AuthLoading());
      await authrepo.complitesignup(userid, username, useraddress, userphone);
      await OneSignalService.init();
      emit(AuthSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";

      if (e is ApiErorr) {
        message = e.message;
      }
      emit(AuthErorr(message));
    }
  }
}
