class WSResponse {
  bool success;
  int? statusCode;
  dynamic data;

  WSResponse({this.success = false, this.statusCode, this.data});
}
