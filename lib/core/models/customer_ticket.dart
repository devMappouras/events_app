class CustomerTicket {
  int ticketId;
  int eventId;
  String eventTitle;
  String eventDateTime;
  int venueId;
  String venueName;
  int categoryId;
  String categoryName;
  String hierarchyName;
  double price;
  String sectionName;

  CustomerTicket(
      {required this.ticketId,
      required this.eventId,
      required this.eventTitle,
      required this.eventDateTime,
      required this.venueId,
      required this.venueName,
      required this.categoryId,
      required this.categoryName,
      required this.hierarchyName,
      required this.price,
      required this.sectionName});

  factory CustomerTicket.fromJson(Map<String, dynamic> json) {
    return CustomerTicket(
      ticketId: json['ticketId'],
      eventId: json['eventId'],
      eventTitle: json['eventTitle'],
      eventDateTime: json['eventDateTime'],
      venueId: json['venueId'],
      venueName: json['venueName'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      hierarchyName: json['hierarchyName'],
      price: json['price'],
      sectionName: json['sectionName'],
    );
  }

  static List<CustomerTicket> ListFromJson(List<dynamic> list) =>
      List<CustomerTicket>.from(list.map((x) => CustomerTicket.fromJson(x)));
}
