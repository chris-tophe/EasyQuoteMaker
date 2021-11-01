import 'package:easy_quote_maker/configuration/server_address.dart';
import 'package:easy_quote_maker/exceptions/not_logged_exception.dart';
import 'package:easy_quote_maker/models/response_token.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetConnect {

  var isLogged = false;
  var token = new ResponseToken();
  final sharedPreferences = GetStorage();

  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => ResponseToken.fromJson(val as Map<String, dynamic>);
    var sharedPreferencesToken = sharedPreferences.read("token");
    token = ResponseToken( token: sharedPreferencesToken ?? '' );
    isLogged = token.token == '' ?  true : false;
  }

  void logIn(String username,String password) async {
    final response = await _getToken(username, password);
    if (response.isOk){
      token = response.body;
      sharedPreferences.write("token", token.token);
      isLogged = true;
    }
    if (response.hasError){
      throw NotLoggedException();
    }
  }

  Future<Response<ResponseToken>> _getToken(
          String username, String password) =>
      post(ServerAddress.AUTH, {"username": username, "password": password});
}
