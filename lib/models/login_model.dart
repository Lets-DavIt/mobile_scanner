class loginModel {
  final String pwd;
  final String email;
  final String secret;

  loginModel({
    required this.email,
    required this.pwd,
    required this.secret,
  });

  factory loginModel.FromMap(Map<String, dynamic> map) {
    return loginModel(
      email: map['email'],
      pwd: map['pwd'],
      secret: map['secret'],
    );
  }
  
}
