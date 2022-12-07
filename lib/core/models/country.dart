class Country {
  int id;
  String name;

  Country({required this.id, required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  static List<Country> ListFromJson(List<dynamic> list) =>
      List<Country>.from(list.map((x) => Country.fromJson(x)));
}
