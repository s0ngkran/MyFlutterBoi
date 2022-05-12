import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  Future<bool> init() async {
    // return await SharedPreferences.getInstance();
    var res = await GetStorage.init();
    var box = Get.put(GetStorage());

    // ignore: avoid_print
    print('init GetStorage res=$res');
    // ignore: avoid_print
    print('box --$box\n------');
    return res;
  }

    // ignore: body_might_complete_normally_nullable
    static Future<String?> boxForString(BoxAction action, String key, {String? text}) async {
    var box = Get.find<GetStorage>();
    if (action == BoxAction.write) {
      box.write(key, text ?? '');
    } else if (action == BoxAction.read) {
      return box.read(key);
    }
  }

  static Future<String?> token(BoxAction action, {String? token}) {
    return boxForString(action, StorageKey.token, text: token);
  }

  static Future<String?> name(BoxAction action, {String? name}) {
    return boxForString(action, StorageKey.name, text: name);
  }
}

enum BoxAction { write, read }

class StorageKey {
  static const token = 'token';
  static const name = 'name';
}