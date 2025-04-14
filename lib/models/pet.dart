class Pet {
  final int? id;
  final String name;
  final String user_id;
  final String breed;
  final int? age;
  final double? weight;

  Pet({
    this.id,
    required this.name,
    required this.user_id,
    required this.breed,
    required this.age,
    required this.weight,
  });

  // Convert a map from Supabase to a Pet object
  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      id: map['id'],
      name: map['name'],
      user_id: map['user_id'],
      breed: map['breed'],
      age: map['age'],
      weight: map['weight'],
    );
  }

  // Convert a Pet object to a map for insertion/updating
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'user_id': user_id,
      'breed' : breed,
      'age': age,
      'weight': weight,
    };
  }
}
