class ResponseToken {
  final String token;

  ResponseToken({this.token = ''});

  factory ResponseToken.fromJson(Map<String, dynamic> json) =>
      ResponseToken(token: json["token"]);
}
