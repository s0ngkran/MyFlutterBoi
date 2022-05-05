import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class View<T> extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  final String? tag = null;

  T get ctx => GetInstance().find<T>(tag: tag)!;
  GetStorage get box => Get.find<GetStorage>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => buildObx()),
    );
  }

  buildObx() {}
}
