class SignInReq {
  final String username;
  final String password;

  SignInReq({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }
}
