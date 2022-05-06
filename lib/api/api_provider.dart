import 'package:get/get.dart';

import '../models/models.dart';
import 'base_provider_old.dart';

// do not use this old provider
class ApiProvider extends BaseProviderOld {
  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> getUsers(String path) {
    return get(path);
  }
}

// class ApiProvider extends BaseProvider {
//   // correct example
//     Future<Map<String, dynamic>?>? register(String path, RegisterReq data) {
//     return post(path, data.toJson(), auth: false);
//   }

// }
