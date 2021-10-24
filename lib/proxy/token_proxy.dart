
import 'package:dio/dio.dart';
import 'package:easy_quote_maker/services/logger.dart';
import 'package:easy_quote_maker/configuration/server_address.dart';
import 'package:easy_quote_maker/models/request_token_user.dart';
import 'package:easy_quote_maker/models/response_token.dart';
import 'package:easy_quote_maker/models/token_storage.dart';
import 'package:easy_quote_maker/proxy/base_proxy.dart';

class TokenProxy extends BaseProxy{

  RequestTokenUser _requestTokenUser;

  TokenProxy():super() {
    BaseOptions options =
    BaseOptions(
        baseUrl: ServerAddress.AUTH,
        responseType: ResponseType.json,
    );
    setOptions(options) ;
  }

  set requestTokenUser(RequestTokenUser value) {
    _requestTokenUser = value;
  }

  fetchToken() async {
    Response response;
    TokenStorage.instance.token = null;
    if (_requestTokenUser != null) {
      try {
        response = await dio.post("", data: _requestTokenUser.toJson());
        if (response.statusCode == 200) {
          TokenStorage.instance.token = ResponseToken
              .fromJson(response.data)
              .token;
        }
      }
      catch (e) {
        Logger.error("Unable to get Token");
      }
    }
  }
}