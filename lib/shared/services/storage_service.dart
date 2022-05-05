import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  Future<bool> init() async {
    // return await SharedPreferences.getInstance();
    var res = await GetStorage.init();
    var box = Get.put(GetStorage());

    print('init GetStorage res=$res');
    print('box --$box');
    return res;
  }
}
