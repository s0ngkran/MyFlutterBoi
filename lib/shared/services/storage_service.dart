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

  static Future<String?> token(BoxAction action, {String? token}) async {
    var box = Get.find<GetStorage>();
    if (action == BoxAction.write) {
      box.write(StorageKey.token, token ?? '');
    } else if (action == BoxAction.read) {
      return  box.read(StorageKey.token);
    }
  }
}

enum BoxAction { write, read }

class StorageKey {
  static const token = 'token';
}