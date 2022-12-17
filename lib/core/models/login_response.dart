class LoginResponse {
  String token;
  Map<String, dynamic> customerInfo;

  LoginResponse({required this.token, required this.customerInfo});

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(
      token: json['token'],
      customerInfo: json['customerInfo'],
    );
  }
}
