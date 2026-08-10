abstract class OrderStatus {}

class OrderInitial extends OrderStatus {}

class OrderLoading extends OrderStatus {}

class OrderSuccess extends OrderStatus {}

class OrderErorr extends OrderStatus {
  final String message;
  OrderErorr({required this.message});
}

class RemoveOrderLoading extends OrderStatus {
  final int id;
  RemoveOrderLoading({required this.id});
}

class RemoveOrderSuccess extends OrderStatus {
  final int id;
  RemoveOrderSuccess({required this.id});
}

class RemoveOrderErorr extends OrderStatus {
  final String message;
  RemoveOrderErorr({required this.message});
}

class GetOrderLoading extends OrderStatus {}

class GetOrderSuccess extends OrderStatus {}

class GetOrderErorr extends OrderStatus {
  final String message;
  GetOrderErorr({required this.message});
}
