import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends GetxController {
  RxString username = "".obs;
  RxString password = "".obs;

  void validateLogin() {
    if (username.value.isEmpty || password.value.isEmpty) {
      Get.snackbar('Error', 'Please enter both username and password');
    } else {
      if (kDebugMode) {
        print('Username: ${username.value}');
        print('Password: ${password.value}');
      }
    }
  }
}
