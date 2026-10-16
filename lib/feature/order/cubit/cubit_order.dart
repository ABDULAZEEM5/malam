import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:malam/core/network/api_erorr.dart';
import 'package:malam/feature/order/cubit/status.dart';
import 'package:malam/feature/order/data/model_order.dart';

import 'package:malam/feature/order/data/repo_order.dart';

class CubitOrder extends Cubit<OrderStatus> {
  CubitOrder() : super(OrderInitial());
  RepoOrder repoOrder = RepoOrder();
  List<ModelOrder> ordermodle = [];
  List<ModelOrder> orderhistorymodle = [];

  String get userid => FirebaseAuth.instance.currentUser!.uid;

  Future order(String service, String address, String description,String craftsmanid,) async {
    try {
      emit(OrderLoading());
      await repoOrder.order(
        userid: userid,
        orderstatus: "قيدالانتظار",
        acceptedby: "",
        description: description,
        service: service,
        craftsmanid:craftsmanid ,
        address: address,
        rejectedby: [],
      );
      emit(OrderSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        print("////////////////////////////////${message.toString()}/${e.message}///////////////////////////////////////");
        message = e.message;
      }
      emit(OrderErorr(message: message));
    }
  }

  Future<void> getorder() async {
    try {
      emit(GetOrderLoading());
      final data = await repoOrder.getorder(userid);
      ordermodle = data;
      emit(GetOrderSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }

      emit(GetOrderErorr(message: message));
    }
  }

  Future<void> getorderhistory() async {
    try {
      emit(GetOrderLoading());
      final data = await repoOrder.getorderhistory(userid);
      orderhistorymodle = data;
      emit(GetOrderSuccess());
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }

      emit(GetOrderErorr(message: message));
    }
  }

  Future<void> removeorder(String orderid, int id) async {
    try {
      emit(RemoveOrderLoading(id: id));
      await repoOrder.removeorder(orderid);
      getorder();
      emit(RemoveOrderSuccess(id: id));
    } catch (e) {
      String message = "حدث شي خطاء";
      if (e is ApiErorr) {
        message = e.message;
      }
      emit(RemoveOrderErorr(message: message));
    }
  }
}
