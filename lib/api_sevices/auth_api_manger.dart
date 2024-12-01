import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_const.dart';
import 'model/request/LoginReguest.dart';
import 'model/request/RegisterRequst.dart';
import 'model/response/LoginResponseDto.dart';
import 'model/response/RegisterResponseDto.dart';

class ApiManger {
//https://ecommerce.routemisr.com/api/v1/auth/signup
  ApiManger._();

  static ApiManger? instance;

  static ApiManger getInstance() {
    instance ??= ApiManger._();
    return instance!;
  }

  ///register
  Future<RegisterResponseDto?> register(String name, String email,
      String password, String rePassword, String phone) async {
    try {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.registerApi);
      var registerRequest = RegisterRequest(
          name: name,
          email: email,
          password: password,
          phone: phone,
          rePassword: rePassword);
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));

      // success
      return registerResponse;
    } catch (e) {
      print("catchRegister : $e");
    }
    return null;
  }

  ///login
  Future<LoginResponseDto?> login(String email, String password) async {
    try {
      Uri url = Uri.https(ApiConst.baseUrl, ApiConst.loginApi);
      var loginRequest = LoginReguest(email: email, password: password);
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));

      // success
      return loginResponse;
    } catch (e) {
      print("catchLogin: $e");
    }
    return null;
  }
}
