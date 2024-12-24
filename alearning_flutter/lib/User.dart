enum Role { TEACHER, STUDENT, ADMIN, NONE }

class User {
  int userid;
  String fullname;
  String email;
  String password;
  Role role;
  String? pass_salt;
  String last_name;

  User({
    required this.fullname,
    required this.email,
    required this.password,
    required this.role,
    required this.userid,
    this.pass_salt,
    required this.last_name,
  });

  // JSON -> User conversion
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userid: json['idUser'],
      fullname: json['firstName'],
      last_name: json['lastName'] ,
      email: json['email'] ,
      password: json['password'] ,  // Default to empty string if null
      pass_salt: json['passSalt'],
      role: Role.values.firstWhere(
            (e) => e.toString() == 'Role.' + json['role'],
        orElse: () => Role.NONE, // Default to NONE if role is unknown
      ),
    );
  }
  // User -> JSON conversion
  Map<String, dynamic> toJson() {
    return {
      'firstName': fullname,
      'email': email,
      'password': password,
      'role': role.toString().split('.').last,  // Ensure the role is sent as a string
      'idUser': userid,
      'passSalt': pass_salt,
      'lastName': last_name,
    };
  }

}

// Convert Role enum to string
String roleToString(Role role) {
  return role.toString().split('.').last;  // Converts Role.Admin to "Admin"
}

// Convert string to Role enum
Role roleFromString(String role) {
  return Role.values.firstWhere((e) => e.toString().split('.').last == role);
}
