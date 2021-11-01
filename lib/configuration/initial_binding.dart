import 'package:easy_quote_maker/services/auth_service.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<AuthService>(AuthService(), permanent: true);
  }

}