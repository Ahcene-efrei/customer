import 'dart:convert';

import 'package:customer/components/button/button.dart';
import 'package:customer/data/api/account_api.dart';
import 'package:customer/data/api/error_exception.dart';
import 'package:customer/styles/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
// import 'package:http/http.dart' as http;
import 'package:customer/data/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CodePage extends StatefulWidget {
  final String phoneNumber;
  final dio = Dio();
  // final storage = new FlutterSecureStorage();
  CodePage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  String code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Vérification du code',
            style: TextStyle(
                color: Black
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation : 1,
        shadowColor: Colors.white70,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Nous vous avons envoyé un code à 4 chiffres au ${widget.phoneNumber}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  VerificationCode(
                    textStyle: TextStyle(fontSize: 20.0),
                    keyboardType: TextInputType.number,
                    // in case underline color is null it will use primaryColor: Colors.red from Theme
                    underlineColor: Colors.amber,
                    length: 4,

                    onCompleted: (String value) {
                      code = value;
                    },
                    onEditing: (bool value) {
                      if(code != ''){
                        code = '';
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              Button(
                text: 'Continuer',
                callBack: ()=> sendCode(widget.phoneNumber, code, context)
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Text(
                      "Réenvoyer le code",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onTap: ()=>{
                      sendPhoneNumber(true, widget.phoneNumber, context)
                    },
                  ),
                  Text(
                    "60 secondes restantes",
                    style: TextStyle(
                      color: Colors.black45
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> sendCode(String phoneNumber, String code, BuildContext context) async {
    try{
      var response = await AccountApi().authenticate(phoneNumber, code);
      print(response);
      if(response['succeeded']){
        Navigator.pushNamedAndRemoveUntil(context, "/homepage", (route) => false);
      }
    }on ErrorException catch (_) {
      print("code error");
    }
  }

  Future<void> sendPhoneNumber(bool isValid, String phoneNumber, BuildContext context) async {
    try{
      AccountApi api = AccountApi();
      var response = await api.sendOtp(phoneNumber);
      if(isValid && response['succeeded']){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CodePage(phoneNumber: phoneNumber),
            )
        );
      }
    }on ErrorException catch (_) {
      print("login error");
    }

  }
}


