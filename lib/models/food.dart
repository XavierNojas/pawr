class Food {
  final int? id;
  final String foodName;
  final double? amount;
  final double? calories;
  final int? pet_id;
  final int? gLoad;

  Food({
    this.id,
    required this.foodName,
    required this.amount,
    required this.calories,
    required this.pet_id,
    required this.gLoad,
  });

  // Convert a map from Supabase to a Food object
  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'],
      foodName: map['foodName'],
      amount: map['amount'],
      calories: map['calories'],
      pet_id: map['pet_id'],
      gLoad: map['gLoad'],
    );
  }

  // Convert a Food object to a map for insertion/updating
  Map<String, dynamic> toMap() {
    return {
      'foodName': foodName,
      'amount': amount,
      'calories': calories,
      'pet_id': pet_id,
      'gLoad': gLoad,
    };
  }
}
