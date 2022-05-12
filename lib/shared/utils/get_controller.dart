import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:get_storage/get_storage.dart';

import '../../api/api_repository.dart';
import '../services/storage_service.dart';

abstract class MyCtl extends GetxController {
  ApiRepository get api => Get.find();
  GetStorage get box => Get.find<GetStorage>();
}
