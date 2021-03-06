import 'package:get/get.dart';

import '../modules/first/first_ctl.dart';
import '../modules/first/first_screen.dart';
import '../modules/for_testing/for_testing.dart';
import '../modules/for_testing/for_testing_ctl.dart';

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
    GetPage(
        name: Routes.forTesting,
        page: () => ForTesting(),
        binding: BindingsBuilder(() {
          Get.lazyPut<ForTestingCtl>(
            () => ForTestingCtl(),
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
