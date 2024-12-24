enum Role { TEACHER, STUDENT, ADMIN, NONE }
enum Level {
  NONE,ING1,ING2,ING3GL,ING3SEC,ING4GL,ING4SEC,ING5GL,ING5SEC,DEFAULT
}
class User {
  int userid;
  String fullname;
  String email;
  String password;
  Role role;
  String? pass_salt;
  String last_name;
Level level;
  User({
    required this.fullname,
    required this.email,
    required this.password,
    required this.role,
    required this.userid,
    this.pass_salt,
    required this.last_name,
    required this.level
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
      level:  Level.values.firstWhere(
            (e) => e.toString() == 'Level.' + json['level'],
        orElse: () => Level.NONE, // Default to NONE if role is unknown
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
      'level':level.toString().split('.').last,
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
