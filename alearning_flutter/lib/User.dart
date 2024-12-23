class User{
  int userid;
  String fullname;
  String email;
  String password;
   Role role;
   String? pass_salt;
   String last_name;
  User({required this.fullname,required this.email,required this.password,required this.role,required this.userid,this.pass_salt,
    required this.last_name

  });
  factory User.fromJson(Map<String,dynamic> json){
    return User(fullname: json['first_name'], email:json['email']
        , password: json['password'], role: json['role'],
        userid: json['id_user'],
    pass_salt: json['pass_salt'],
      last_name: json['last_name']
    );
  }
  Map<String,dynamic> toJson(){
    return{
      'first_name':fullname,
      'email':email,
      'password':password,
      'role':role,
      'id_user':userid,
      'pass_salt':pass_salt,
      'last_name':last_name
    };
  }
}
enum Role{Teacher,Student,Admin,None}