import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api_repository.dart';
import '../../routes/app_pages.dart';
import '../../shared/services/storage_service.dart';
import '../../shared/utils/focus.dart';
import '../../shared/utils/get_controller.dart';

class FirstCtl extends MyCtl {
  var show = ''.obs;
  var selectedIndex = 0.obs;
  var dummy = ''.obs;
  var width = 0.0.obs;
  var loginKey = GlobalKey<FormState>();
  var username = TextEditingController();
  var password = TextEditingController();
  onItemTapped(val) {
    selectedIndex.value = val;
  }

  getWidth() {
    width.value = Get.width;
    print('new width');
  }

  void login() async {
    var context = Get.context!;
    AppFocus.unfocus(context);
    if (loginKey.currentState!.validate()) {
      ////// send api
      // ignore: avoid_print
      print('validated data\nusername=${username.text}\npassword=${password.text}');
      // final res = await api.login(
      // LoginRequest(
      //   username: username.text,
      //   password: password.text,
      // ),
      // );

      ////// write to storage
      String resultFromApi = 'success';
      if (resultFromApi == 'success') {
        // ignore: avoid_print
        print('save to storgae');
        StorageService.name(
          BoxAction.write,
          name: 'john',
        );
        // ignore: avoid_print
        print('go to ...page');
        Get.toNamed(Routes.first);
      }
      // final prefs = Get.find<SharedPreferences>();
      // if (res!.token.isNotEmpty) {
      //   prefs.setString(StorageConstants.token, res.token);
      //   Get.toNamed(Routes.HOME);
      // }
    }
  }
}
