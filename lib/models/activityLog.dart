class ActivityLog {
  final int? id;
  final List<String> activityLogs;
  final int? petId;
  final String? observation;
  final String? created_at;

  ActivityLog({
    this.id,
    required this.activityLogs,
    required this.petId,
    this.observation,
    this.created_at
  });

  // Convert a map from Supabase to a ActivityLog object
  factory ActivityLog.fromMap(Map<String, dynamic> map) {
    return ActivityLog(
      id: map['id'],
      activityLogs: (map['activityLogs'] as List<dynamic>?)
        !.map((e) => e.toString())
        .toList(),
      petId: map['petId'],
      observation: map['observation'],
      created_at: map['created_at'],
    );
  }

  // Convert a ActivityLog object to a map for insertion/updating
  Map<String, dynamic> toMap() {
    return {
      'activityLogs': activityLogs,
      'petId': petId,
      'observation': observation,
    };
  }
}
