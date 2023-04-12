class AnimalsType {
  static List animalType = [
    "Birds",
    "Lion",
    "Reptiles",
    "Invertebrates",
    "Mammals",
    "Amphibians",
    "Fish",
  ];
}

class Animal {
  int? id;
  String name;
  String description;
  String image;
  String type;

  Animal({
    this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.type,
  });

  factory Animal.fromMap(Map<String, dynamic> data) {
    return Animal(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        image: data['image'],
        type: data['type']);
  }
}


class AnimalDB {
  int? id;
  String name;
  String description;
  String image;
  String type;

  AnimalDB({
    this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.type,
  });

  factory AnimalDB.fromMap({required Animal data}) {
    return AnimalDB(
        name: data.name,
        description: data.description,
        image: data.image,
        type: data.type);
  }
}