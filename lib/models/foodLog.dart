class FoodLog {
  final int? id;
  final String foodName;
  final double? amount;
  final double? calories;
  final int? pet_id;
  final int? gLoad;
  final String? created_at;

  FoodLog({
    this.id,
    required this.foodName,
    required this.amount,
    required this.calories,
    required this.pet_id,
    required this.gLoad,
    this.created_at,
  });

  // Convert a map from Supabase to a FoodLog object
  factory FoodLog.fromMap(Map<String, dynamic> map) {
    return FoodLog(
      id: map['id'],
      foodName: map['foodName'],
      amount: map['amount'],
      calories: map['calories'],
      pet_id: map['pet_id'],
      gLoad: map['gLoad'],
      created_at: map['created_at'],
    );
  }

  // Convert a FoodLog object to a map for insertion/updating
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
