import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:customer/data/api/api.dart';
import 'package:customer/data/api/error_exception.dart';

class AccountApi extends Api{

  Future<dynamic> sendOtp(String phoneNumber) async {
    final dio = Dio(BaseOptions(contentType: "application/json; charset=utf-8"));
    var response = await dio.post("https://labonnecoupe.azurewebsites.net/api/Customer/SendOtp",
      data: {
        'phoneNumber': phoneNumber,
      }
    );
    return response.data;
  }

  Future<dynamic> authenticate(String phoneNumber, String otp) async {
    print("AccountApi.authenticate");
    final dio = Dio();
    print("phoneNumber: ${phoneNumber}");
    print("otp: ${otp}");
    var response = await dio.post('https://labonnecoupe.azurewebsites.net/api/Customer/Authenticate',
      data: {
      'phoneNumber': phoneNumber,
      'token':otp
      },
    );

    if(response.statusCode == 200 && response.data['succeeded']) {
      var jsonData = jsonDecode(jsonEncode(response.data["data"]));
      await storage.write(key: 'jwt', value: jsonData['jwtToken']);
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