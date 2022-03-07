import 'dart:convert';
import 'dart:io';

import 'package:customer/data/models/User.dart';
import 'package:dio/dio.dart';
import 'package:customer/data/api/api.dart';
import 'package:customer/data/api/error_exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountApi extends Api{

  Future<dynamic> sendOtp(String phoneNumber) async {
    print("SendOTP");
    final dio = Dio(BaseOptions(contentType: "application/json; charset=utf-8"));
    print("dio");
    var params =  {
      'phoneNumber': phoneNumber,
    };
    print(phoneNumber);
    var response = await dio.post("https://labonnecoupe.azurewebsites.net/api/Customer/SendOtp",
      data: jsonEncode(params)
    );
    if(response.statusCode != 200 && !response.data['succeeded']) {
      throw ErrorException(
          succeeded: response.data['succeeded'],
          errorCode: response.data['errorCode'],
          message: response.data['message'],
          errors: response.data['errors']
      );
    }
    return response.data;
  }

  Future<dynamic> authenticate(String phoneNumber, String otp) async {
    print("AccountApi.authenticate");
    // final storage = new FlutterSecureStorage();
    // await storage.deleteAll();
    final prefs = await SharedPreferences.getInstance();
    final dio = Dio(BaseOptions(contentType: "application/json; charset=utf-8"));
    var params =  {
      'phoneNumber': phoneNumber,
      'otp':otp
    };
    print("phoneNumber: ${phoneNumber}");
    print("otp: ${otp}");
    var response = await dio.post('https://labonnecoupe.azurewebsites.net/api/Customer/Authenticate',
      data: jsonEncode(params)
    );
    print(response);
    if(response.statusCode == 200 && response.data['succeeded']) {
      var jsonData = jsonDecode(jsonEncode(response.data["data"]));
      print('write');
      await prefs.setString('jwt', jsonData['jwtToken']);
      // await storage.write(key: 'jwt', value: jsonData['jwtToken']);
      // await storage.write(key: 'user', value: jsonData['data']['user']);
      print('error');
      return response.data;
    }else{
      throw ErrorException(
        succeeded: response.data['succeeded'],
        errorCode: response.data['errorCode'],
        message: response.data['message'],
        errors: response.data['errors']
      );
    }
  }

}