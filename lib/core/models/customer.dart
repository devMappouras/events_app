class Customer {
  int? customerId;
  String firstName;
  String lastName;
  String email;
  int countryId;
  String username;
  String? password;

  Customer(
      {this.customerId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.countryId,
      required this.username,
      this.password});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerId: json['customerId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      countryId: json['countryId'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'countryId': countryId,
        'username': username,
        'password': password,
      };

  static List<Customer> ListFromJson(List<dynamic> list) =>
      List<Customer>.from(list.map((x) => Customer.fromJson(x)));
}
