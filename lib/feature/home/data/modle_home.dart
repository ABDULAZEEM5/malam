class ModleHome {
  final String name;
  final String icon;
  ModleHome({required this.name, required this.icon});
  factory ModleHome.fromMap(Map<String, dynamic> map) {
    return ModleHome(name: map["name"], icon: map["icon"]);
  }

  Map<String, dynamic> toMap() => {"name": name, "icon": icon};
}

class ModleNotification {
  final String body;
  final String title;
  final bool isRead;
  final dynamic createdAt;
  ModleNotification({
    required this.body,
    required this.title,
    required this.isRead,
    required this.createdAt,
  });
  factory ModleNotification.fromMap(Map<dynamic, dynamic> map) {
    return ModleNotification(
      body: map["body"],
      title: map["title"],
      createdAt: map["createdAt"],
      isRead: map["isRead"],
    );
  }
}
