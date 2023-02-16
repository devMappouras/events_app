class Ticket {
  int customerId;
  int purchaseId;
  int eventProductId;
  int sectionId;

  Ticket(
      {required this.customerId,
      required this.purchaseId,
      required this.eventProductId,
      required this.sectionId});

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'purchaseId': purchaseId,
        'eventProductId': eventProductId,
        'sectionId': sectionId,
      };
}
