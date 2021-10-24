import 'package:easy_quote_maker/configuration/server_address.dart';
import 'package:easy_quote_maker/models/user.dart';
import 'package:easy_quote_maker/proxy/crud_proxy.dart';
import 'package:easy_quote_maker/proxy/token_proxy.dart';

class ProxyFactory {
  static TokenProxy createTokenProxy(){
    return new TokenProxy();
  }
  static CrudProxy<User> createUserProxy(){
    return new CrudProxy<User>(ServerAddress.USER, new User());
  }
}