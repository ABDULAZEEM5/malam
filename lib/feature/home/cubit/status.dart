abstract class HomeStatus {}

class HomeInitial extends HomeStatus {}

class HomeLoading extends HomeStatus {}

class HomeSuccess extends HomeStatus {}

class HomeErorr extends HomeStatus {
  final String message;
  HomeErorr({required this.message});
}

class NotifictionLoading extends HomeStatus {}

class NotifictionSuccess extends HomeStatus {}

class NotifictionErorr extends HomeStatus {
  final String message;
  NotifictionErorr({required this.message});
}
