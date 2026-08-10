
class ModleTechnical {
  final String name;
  final String service;
  final String description;
  final String address;
  final String experience;
  final String rota;
  final String image;

  ModleTechnical({
    required this.name,
    required this.address,
    required this.service,
    required this.image,
    required this.description,
    required this.experience,
    required this.rota,
  });

  factory ModleTechnical.fromMap(Map<String, dynamic> map) {
    return ModleTechnical(
      name: map["name"]??"",
      address: map["address"]??"",
      service: map["service"]??"",
      image: map["image"]??"",
      description: map["description"]??"",
      experience: map["experience"]??"",
      rota: map["rota"]??"",
    );
  }

  Map<String, dynamic> toMap() => {
    "name": name,
    "description": description,
    "address": address,
    "service": service,
    "image": image,
    "experience": experience,
    "rota": rota,
  };
}
