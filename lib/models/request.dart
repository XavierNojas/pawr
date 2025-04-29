class Request {
  final int? id;
  final String start_date;
  final String finish_date;
  final String? status;
  final String? rate_type;
  final String? total;
  final String? instructions;
  final int? duration;
  final List<String?> tasks;
  final int? pet_id;
  final String? user_id;
  final String? caretaker_id;


  Request({
    this.id,
    required this.start_date,
    required this.finish_date,
    required this.status,
    required this.rate_type,
    required this.total,
    required this.instructions,
    required this.duration,
    required this.tasks,
    required this.pet_id,
    required this.user_id,
    this.caretaker_id,
  });

  // Convert a map from Supabase to a User object
  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      id: map['id'],
      start_date: map['start_date'],
      finish_date: map['finish_date'],
      status: map['status'],
      rate_type: map['rate_type'],
      total: map['total'],
      instructions: map['instructions'],
      duration: map['duration'],
      tasks: (map['tasks'] as List<dynamic>?)
        !.map((e) => e.toString())
        .toList(), // <-- THIS CONVERTS TO List<String>
      pet_id: map['pet_id'],
      user_id: map['user_id'],
      caretaker_id: map['caretaker_id'],
    );
  }

  // Convert a User object to a map for insertion/updating
  Map<String, dynamic> toMap() {
    return {
      'start_date': start_date,
      'finish_date': finish_date,
      'status': status,
      'rate_type': rate_type,
      'total': total,
      'instructions': instructions,
      'duration': duration,
      'tasks': tasks,
      'pet_id': pet_id,
      'user_id': user_id,
      'caretaker_id': caretaker_id,
    };
  }
}









































































































































































































































































// congratulations !!