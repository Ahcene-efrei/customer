import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Api{
  // final storage = new FlutterSecureStorage();

  Future<String> getJTWToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? key = prefs.getString('jwt');
    if(key == null){
      throw Exception("Key is not defined");
    }
    return key;
  }
}