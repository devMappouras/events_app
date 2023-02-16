class PurchaseIdResponse {
  int purchaseId;

  PurchaseIdResponse({required this.purchaseId});

  factory PurchaseIdResponse.fromJson(Map<String, dynamic> json) {
    return PurchaseIdResponse(
      purchaseId: json['purchaseId'],
    );
  }
}
