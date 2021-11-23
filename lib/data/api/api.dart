import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class Api{
  final storage = new FlutterSecureStorage();

  Future<String> getJTWToken() async {

    String? key = await storage.read(key: "jwt");
    if(key == null){
      throw Exception("Key is not defined");
    }
    return key;
  }
}