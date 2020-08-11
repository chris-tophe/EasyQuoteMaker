import 'package:easy_quote_maker/configuration/server_address.dart';
import 'package:easy_quote_maker/model/user.dart';
import 'package:easy_quote_maker/proxy/crud_proxy.dart';
import 'package:easy_quote_maker/proxy/token_proxy.dart';

class ProxyFactory {
  static TokenProxy createTokenProxy() {
    return new TokenProxy();
  }

  static CrudProxy<User> createUserProxy(String token) {
    return CrudProxy<User>(
      url: ServerAddress.USER,
      token: token,
      newType: User(),
    );
  }
}
