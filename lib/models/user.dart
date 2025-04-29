class UserDetails {
  final int? id;
  final String username;
  final String userType;
  final String userId;
  final String email;
  final String phone;

  UserDetails({
    this.id,
    required this.username,
    required this.userType,
    required this.userId,
    required this.email,
    required this.phone,
  });

  // Convert a map from Supabase to a User object
  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      id: map['id'],
      username: map['username'],
      userType: map['userType'],
      userId: map['userId'],
      email: map['email'],
      phone: map['phone'],
    );
  }

  // Convert a User object to a map for insertion/updating
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'userType': userType,
      'userId': userId,
      'email': email,
      'phone': phone,
    };
  }
}
