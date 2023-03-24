class HttpResponse {
  int? statusCode;
  dynamic value;

  HttpResponse({this.statusCode, this.value});

  factory HttpResponse.fromJson(dynamic json) {
    return HttpResponse(
      statusCode: json['statusCode'],
      value: json['value'],
    );
  }
}
