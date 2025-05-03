class Activity {
  final int? id;
  final String? activityName;
  final String? notes;
  final int? petId;

  Activity({
    this.id,
    required this.activityName,
    required this.notes,
    required this.petId
  });

  // Convert a map from Supabase to a Activity object
  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      activityName: map['activityName'],
      notes: map['notes'],
      petId: map['pet_id'],
    );
  }

  // Convert a Activity object to a map for insertion/updating
  Map<String, dynamic> toMap() {
    return {
      'activityName': activityName,
      'notes': notes,
      'pet_id': petId,
    };
  }
}
