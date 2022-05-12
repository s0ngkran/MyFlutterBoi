import 'package:get/get.dart';

import '../modules/first/first_ctl.dart';
import '../modules/first/first_screen.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static final routes = [
    GetPage(
        name: Routes.first,
        page: () => FirstScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut<FirstCtl>(
            () => FirstCtl(),
          );
        })),
    //////////////////
    ///////////////
    ///////////////
    ///////////////
    //////////////// this is how to use bindings builder
    ///////////////
    ///////////////
    ///////////////
    // GetPage(
    //   name: '/auth',
    //   page: () => AuthScreen(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<TestBoxCtl>(
    //       () => TestBoxCtl(),
    //     );
    //   }),
    // ),
  ];
}
