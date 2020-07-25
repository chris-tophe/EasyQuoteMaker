class TokenStorage{

  TokenStorage._privateConstructor();

  static TokenStorage _instance = TokenStorage._privateConstructor();

  String _token;

  static TokenStorage get instance => _instance;

  String get token => _token;

  set token(String value) {
    _token = value;
  }
}