class MoodLog {
  final int? id;
  final List<String> mood;
  final int? petId;
  final String? observation;
  final String? created_at;

  MoodLog({
    this.id,
    required this.mood,
    required this.petId,
    this.observation,
    this.created_at
  });

  // Convert a map from Supabase to a MoodLog object
  factory MoodLog.fromMap(Map<String, dynamic> map) {
    return MoodLog(
      id: map['id'],
      mood: (map['mood'] as List<dynamic>?)
        !.map((e) => e.toString())
        .toList(),
      petId: map['petId'],
      observation: map['observation'],
      created_at: map['created_at'],
    );
  }

  // Convert a MoodLog object to a map for insertion/updating
  Map<String, dynamic> toMap() {
    return {
      'mood': mood,
      'petId': petId,
      'observation': observation,
    };
  }
}
