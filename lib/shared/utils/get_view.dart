import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_const.dart';

// abstract class ViewCtl<T> extends StatelessWidget {
//   const ViewCtl({Key? key}) : super(key: key);

//   final String? tag = null;

//   T get ctl => GetInstance().find<T>(tag: tag)!;
//   GetStorage get box => Get.find<GetStorage>();

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Obx(() => buildObx()),
//     );
//   }

//   buildObx() {}
// }

abstract class View<T> extends StatelessWidget {
  const View({Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  // ResponsiveScreen();

  final String? tag = null;

  T get ctl => GetInstance().find<T>(tag: tag)!;
  GetStorage get box => Get.find<GetStorage>();
  Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  // ignore: body_might_complete_normally_nullable
  ScreenType? scr(BuildContext context) {
    var size = getSize(context);
    double width = size.width;
    // double height = size.height;
    if (width > AppConst.breakPointDesktop) {
      return ScreenType.desktop;
    } else if (width > AppConst.breakPointTablet) {
      return ScreenType.tablet;
    } else {
      return ScreenType.phone;
    } // return null;
  }

  @override
  Widget build(BuildContext context) {
    onBuild();
    ScreenType? screen = scr(context);
    return SafeArea(
      child: Builder(
        builder: (BuildContext context) {
          if (screen == ScreenType.desktop) {
            return Obx(
              () {
                return desktop(context);
              },
            );
          } else if (screen == ScreenType.tablet) {
            return Obx(
              () {
                return tablet(context);
              },
            );
          } else if (screen == ScreenType.phone) {
            return Obx(
              () {
                return phone(context);
              },
            );
          } else {
            return Obx(
              () {
                return desktop(context);
              },
            );
          }
        },
      ),
    );
    // return WillPopScope(
    //   onWillPop: () async => false,
    //   child: Obx(
    //     () => buildObx(context),
    //   ),
    // );
  }

   desktop(BuildContext context) {
    return const SafeArea(child: Text('not support desktop'));
  }

   tablet(BuildContext context) {
    return const SafeArea(child: Text('not support tablet'));
  }

   phone(BuildContext context) {
    return const SafeArea(child: Text('not support phone'));
  }

  onBuild({BuildContext? context}) {}
}

enum ScreenType { desktop, tablet, phone }
