class User{
  int userid;
  String fullname;
  String email;
  String password;
  String username;
  Role role;
  User({required this.fullname,required this.email,required this.password,required this.role,required this.userid,
  required this.username
  });
  factory User.fromJson(Map<String,dynamic> json){
    return User(fullname: json['fullname'], email:json['email']
        , password: json['password'], role: json['role'],
        userid: json['userid'], username:json['username']);
  }
  Map<String,dynamic> toJson(){
    return{
      'fullname':fullname,
      'email':email,
      'password':password,
      'role':role,
      'userid':userid,
      'username':username
    };
  }
}
enum Role{Teacher,Student,Admin}