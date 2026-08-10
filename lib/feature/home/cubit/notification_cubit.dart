import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/feature/home/cubit/status.dart';
import 'package:malam/feature/home/data/modle_home.dart';
import 'package:malam/feature/home/data/repo_home.dart';

class CubitNotification extends Cubit<HomeStatus> {
  CubitNotification() : super(HomeInitial());
  RepoHome repohome = RepoHome();
  List<ModleNotification?> notifiction = [];
  String get userid => FirebaseAuth.instance.currentUser!.uid;

  Future getnotification() async {
    try {
      emit(NotifictionLoading());
      final data = await repohome.getnotification(userid);
      notifiction = data;
      print("///////////////////////////$data////////////////////");
        print("///////////////////////////$notifiction////////////////////");
      emit(NotifictionSuccess());
    } catch (e) {
       print("///////////////////////////$e//77777777777777777//////////////////");
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
          print("///////////////////////////$message////////////////////");
      emit(NotifictionErorr(message: message));
    }
  }
}
