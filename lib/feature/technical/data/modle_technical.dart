class ModleTechnical {
  final String id;
  final String name;
  final String service;
  final String description;
  final String address;
  final String experience;
  final String rota;
  final String image;
  final List<ImgesWorkerModle>? workerimages;

  ModleTechnical({
    required this.id,
    required this.name,
    required this.address,
    required this.service,
    required this.image,
    required this.description,
    required this.experience,
    required this.rota,
    this.workerimages,
  });

  factory ModleTechnical.fromMap(Map<String, dynamic> map) {
    return ModleTechnical(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      address: map["address"] ?? "",
      service: map["service"] ?? "",
      image: map["imageUrl"] ?? "",
      description: map["description"] ?? "",
      experience: map["experience"] ?? "",
      rota: map["rota"] ?? "",
      workerimages: (map['workImages'] as List?)
          ?.map(
            (item) => ImgesWorkerModle.fromMap(Map<String, dynamic>.from(item)),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "address": address,
    "service": service,
    "image": image,
    "experience": experience,
    "rota": rota,
  };
}

class ImgesWorkerModle {
  final String imageUrl;
  final String publicId;

  ImgesWorkerModle({required this.imageUrl, required this.publicId});

  factory ImgesWorkerModle.fromMap(Map<String, dynamic> map) {
    return ImgesWorkerModle(
      imageUrl: map["imageUrl"],
      publicId: map["publicId"],
    );
  }
}
