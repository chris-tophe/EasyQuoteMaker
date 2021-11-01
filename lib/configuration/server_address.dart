import 'package:get/get.dart';

class ServerAddress {
  static final String _server =
      GetPlatform.isMobile ? "https://10.0.2.2:8100" : "https://localhost:8100";
  static final String AUTH = _server + "/login";
  static final String USER = _server + "/user";
}
