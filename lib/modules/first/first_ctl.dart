import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api_repository.dart';
import '../../shared/utils/focus.dart';
import '../../shared/utils/get_controller.dart';

class FirstCtl extends MyCtl {
  var show = ''.obs;
  var selectedIndex = 0.obs;
  var dummy = ''.obs;
  var width = 0.0.obs;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  var username = TextEditingController();
  var password = TextEditingController();
  onItemTapped(val) {
    selectedIndex.value = val;
  }

  getWidth() {
    width.value = Get.width;
    print('new width');
  }

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (loginKey.currentState!.validate()) {
      ////// send api
      // ignore: avoid_print
      print('validated data\n$username={username.value}\npassword=${password.value}');
      // final res = await api.login(
      // LoginRequest(
      //   username: username.text,
      //   password: password.text,
      // ),
      // );

      ////// write to storage
      // final prefs = Get.find<SharedPreferences>();
      // if (res!.token.isNotEmpty) {
      //   prefs.setString(StorageConstants.token, res.token);
      //   Get.toNamed(Routes.HOME);
      // }
    }
  }
}
