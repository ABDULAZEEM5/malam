import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/feature/technical/cubit/status.dart';
import 'package:malam/feature/technical/data/modle_technical.dart';
import 'package:malam/feature/technical/data/repo_technicla.dart';

class CubitTechnical extends Cubit<TechnicalStatus> {
  CubitTechnical() : super(TechnicalIniail());
  List<ModleTechnical?> modletchnical = [];
  ModleTechnical? onemodletechnicl;
  RepoTechnicla repotechnical = RepoTechnicla();

  Future gettechnical() async {
    try {
      emit(TechnicalLoading());
      final data = await repotechnical.gettechnical();
      modletchnical = data;
      emit(TechnicalSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(TechnicalErorr(message: message));
    }
  }

   Future getonetechnical() async {
    try {
      emit(TechnicalLoading());
      final data = await repotechnical.getnoetechnical();
      onemodletechnicl = data;
      emit(TechnicalSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(TechnicalErorr(message: message));
    }
  }
}
