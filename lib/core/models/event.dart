class Event {
  int eventId;
  String eventTitle;
  String? eventDescription;
  String eventDateTime;
  String? categoryId;
  String? venueNameId;
  String venueName;
  String? collectionId;
  String? organiserId;
  String? organiserName;

  Event(
      {required this.eventId,
      required this.eventTitle,
      this.eventDescription,
      required this.eventDateTime,
      this.categoryId,
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
