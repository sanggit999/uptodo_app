class SignUpReq {
  final String username;
  final String password;

  SignUpReq({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
