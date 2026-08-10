import 'package:bloc/bloc.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/feature/home/cubit/status.dart';
import 'package:malam/feature/home/data/modle_home.dart';
import 'package:malam/feature/home/data/repo_home.dart';

class CubitHome extends Cubit<HomeStatus> {
  CubitHome() : super(HomeInitial());
  RepoHome repohome = RepoHome();
  List<ModleHome?> services = [];

  Future getservice() async {
    try {
      emit(HomeLoading());
      final data = await repohome.getService();
      services = data;
      emit(HomeSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(HomeErorr(message: message));
    }
  }
}
