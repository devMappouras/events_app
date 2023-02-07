class Event {
  int eventId;
  String eventTitle;
  String? eventDescription;
  String eventDateTime;
  int? categoryId;
  String? categoryName;
  int? venueNameId;
  String venueName;
  int? collectionId;
  int? organiserId;
  String? organiserName;

  Event(
      {required this.eventId,
      required this.eventTitle,
      this.eventDescription,
      required this.eventDateTime,
      this.categoryId,
      this.categoryName,
      this.venueNameId,
      required this.venueName,
      this.collectionId,
      this.organiserId,
      this.organiserName});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['eventId'],
      eventTitle: json['eventTitle'],
      eventDescription: json['eventDescription'],
      eventDateTime: json['eventDateTime'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      venueNameId: json['venueNameId'],
      venueName: json['venueName'],
      collectionId: json['collectionId'],
      organiserId: json['organiserId'],
      organiserName: json['organiserName'],
    );
  }

  static List<Event> ListFromJson(List<dynamic> list) =>
      List<Event>.from(list.map((x) => Event.fromJson(x)));
}
