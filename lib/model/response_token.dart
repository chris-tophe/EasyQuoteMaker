class ResponseToken {
  String _token;

  ResponseToken.fromJson(Map<String, dynamic> json){
    _token = json["token"];
  }

  String get token => _token;
}