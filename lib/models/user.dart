class UserDetails {
  final int? id;
  final String username;
  final String userType;
  final String userId;

  UserDetails({
    this.id,
    required this.username,
    required this.userType,
    required this.userId,
  });

  // Convert a map from Supabase to a User object
  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      id: map['id'],
      username: map['username'],
      userType: map['userType'],
      userId: map['userId'],
    );
  }

  // Convert a User object to a map for insertion/updating
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'userType': userType,
      'userId': userId,
    };
  }
}
