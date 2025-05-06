class Friends {
  final int? id;
  final String owner_Id;
  final List<String?> referredFriends;
  final List<String?> referredPets;

  Friends({
    this.id,
    required this.owner_Id,
    required this.referredFriends,
    required this.referredPets,
  });

  // Convert a map from Supabase to a User object
  factory Friends.fromMap(Map<String, dynamic> map) {
    return Friends(
      id: map['id'],
      owner_Id: map['owner_Id'],
      referredFriends: (map['referredFriends'] as List<dynamic>?)
        !.map((e) => e.toString())
        .toList(),
      referredPets: (map['referredPets'] as List<dynamic>?)
        !.map((e) => e.toString())
        .toList(),
    );
  }

  // Convert a User object to a map for insertion/updating
  Map<String, dynamic> toMap() {
    return {
      'owner_Id': owner_Id,
      'referredFriends': referredFriends,
      'referredPets': referredPets,
    };
  }
}
