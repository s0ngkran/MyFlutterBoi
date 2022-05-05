import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api_repository.dart';
import '../../shared/utils/get_controller.dart';

class FirstCtl extends MyCtl {

  var show = ''.obs;
  var selectedIndex = 0.obs;
  var dummy = ''.obs;
  onItemTapped(val) {
    selectedIndex.value = val;
  }
}
