import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../shared/services/services.dart';
import 'api.dart';
import 'package:http/http.dart' as http;

class BaseProvider {
  // @override
  // void onInit() {
  //   httpClient.baseUrl = ApiConstants.baseUrl;
  //   httpClient.addAuthenticator(authInterceptor);
  //   httpClient.addRequestModifier(requestInterceptor);
  //   httpClient.addResponseModifier(responseInterceptor);
  // }

  Future<Map<String, dynamic>?>? get(String url, {bool auth = true}) {
    var request = http.Request('GET', Uri.parse(ApiConstants.baseUrl + url));
    return apiSend(request, data: null, auth: auth);
  }

  Future<Map<String, dynamic>?>? post(String url, dynamic data, {bool auth = true}) {
    var request = http.Request('POST', Uri.parse(ApiConstants.baseUrl + url));
    return apiSend(request, data: data, auth: auth);
  }

  Future<Map<String, dynamic>?>? patch(String url, dynamic data, {bool auth = true}) {
    var request = http.Request('PATCH', Uri.parse(ApiConstants.baseUrl + url));
    return apiSend(request, data: data, auth: auth);
  }

  Future<Map<String, dynamic>?>? put(String url, dynamic data, {bool auth = true}) {
    var request = http.Request('PUT', Uri.parse(ApiConstants.baseUrl + url));
    return apiSend(request, data: data, auth: auth);
  }

  Future<Map<String, dynamic>?>? apiSend(Request request, {Map<String, dynamic>? data, required bool auth}) async {
    // handle token
    Map<String, String> headers;
    if (auth == true) {
      Request? requestX = await handleToken(request);
      if (request == null) return null;
    } else {
      headers = {'Content-Type': 'application/json'};
      request.headers.addAll(headers);
    }
    // body
    if (data != null) {
      request.body = json.encode(data);
    }

    // request send
    http.StreamedResponse response = await request.send();

    // handle response
    Map<String, dynamic>? resp = await handleResponse(response);
    return resp;
  }

  Future<Request?>? handleToken(Request request) async {
    var token = await StorageService.token(BoxAction.read);
    var headers;
    if (token == null) {
      Get.defaultDialog(title: 'Has no token');
      print('has no token; no api sent');
      return null;
    } else {
      headers = {'Authorization': 'Token ${token}', 'Content-Type': 'application/json'};
      request.headers.addAll(headers);
      return request;
    }
  }

  Future<Map<String, dynamic>?>? handleResponse(response) async {
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Map<String, dynamic> resJson = json.decode(res);
      return resJson;
    } else {
      var error = response.reasonPhrase;
      print('api status != 200\nreason phase=$error');
      Get.defaultDialog(title: 'API error', content: Text('$error'));
      return null;
    }
  }
}
