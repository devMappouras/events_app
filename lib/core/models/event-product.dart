class EventProduct {
  int eventProductId;
  int productId;
  int hierarchyId;
  String hierarchyName;
  double price;
  int sectionId;
  String sectionName;
  int capacity;

  EventProduct(
      {required this.eventProductId,
      required this.productId,
      required this.hierarchyId,
      required this.hierarchyName,
      required this.price,
      required this.sectionId,
      required this.sectionName,
      required this.capacity});

  factory EventProduct.fromJson(Map<String, dynamic> json) {
    return EventProduct(
      eventProductId: json['eventProductId'],
      productId: json['productId'],
      hierarchyId: json['hierarchyId'],
      hierarchyName: json['hierarchyName'],
      price: json['price'],
      sectionId: json['sectionId'],
      sectionName: json['sectionName'],
      capacity: json['capacity'],
    );
  }

  static List<EventProduct> ListFromJson(List<dynamic> list) =>
      List<EventProduct>.from(list.map((x) => EventProduct.fromJson(x)));
}
