import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

import '../../api/api_repository.dart';

abstract class MyCtl extends GetxController {
  ApiRepository get api => Get.find();
  final RxString dummy = ''.obs;
}
