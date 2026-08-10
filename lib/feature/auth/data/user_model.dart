class UserModel {
  final String name;
  final String address;
  final String phone;
  final String? imageUrl;

  UserModel({
    required this.name,
    required this.address,
    required this.phone,
    this.imageUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? "",
      address: map['address'] ?? "",
      imageUrl: map['imageUrl'] ?? "",
      phone: map['phone'] ?? "",
    );
  }

  Map<String, dynamic> toMap() => {
    "name": name,
    "address": address,
    "phone": phone,
  };
}

class UserImageModel {
  final String imageUrl;
  UserImageModel({required this.imageUrl});

  factory UserImageModel.fromMap(Map<String, dynamic> map) {
    return UserImageModel(imageUrl: map['imageUrl'] );
  }

  Map<String, dynamic> toMap() => {"imageUrl": imageUrl};
}
