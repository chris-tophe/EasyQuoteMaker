import 'package:easy_quote_maker/models/user.dart';
import 'package:easy_quote_maker/services/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController{

  final userService = Get.find<UserService>();

  final user$ = new User().obs;

  @override
  void onInit() async {
      super.onInit();
      var response = await userService.getCurrentUser();
      if (response.isOk){
        user$.value = response.body;

      }
  }
}