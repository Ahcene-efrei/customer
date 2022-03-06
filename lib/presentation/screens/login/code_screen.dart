import 'dart:convert';

import 'package:customer/components/button/button.dart';
import 'package:customer/data/api/account_api.dart';
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
  final storage = new FlutterSecureStorage();
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
                callBack: ()=> Navigator.pushNamedAndRemoveUntil(context, "/homepage", (route) => false)
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Réenvoyer le code",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
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
    var jsonData = null;
    //SharedPreferences preferences = await SharedPreferences.getInstance();
    //await preferences.clear();
    print("aza");
    var response = await AccountApi().authenticate(phoneNumber, code);
    // var response = await widget.dio.post(
    //   'https://labonnecoupe.azurewebsites.net/api/Customer/AuthenticateOrRegister',
    //   data: {
    //     'phoneNumber': phoneNumber,
    //     'token':code
    //   },
    // );
    print(response);
    jsonData = jsonDecode(jsonEncode(response.data["data"]));
    if(response.statusCode == 200 && response.data['succeeded']){

      //preferences.setString('token', jsonData['data']['jwtToken']);
      var user = jsonData['user'];

      User loggedUser = User(
          hairType: user['hairType'],
          lastname: user['lastname'],
          firstname: user['firstname'],
          email: user['email'],
          phoneNumber: user['phoneNumber'],
          gender: user['gender'],
          pictureUrl: user['pictureUrl'],
          commandCount: user['commandCount'],
          status: user['status'],
          addresses: user['addresses']
      );
      await widget.storage.write(key: 'jwt', value: jsonData['jwtToken']);
      await widget.storage.write(key: 'user', value: jsonEncode(loggedUser.toJson()));
      print(loggedUser.firstname);
      Navigator.pushNamedAndRemoveUntil(context, "/homepage", (route) => false);
    }
    //SharedPreferences preferences = await SharedPreferences.getInstance();
    //await preferences.clear();
    /*var url = Uri.parse('https://labonnecoupe.azurewebsites.net/api/Customer/AuthenticateOrRegister');
  var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'phoneNumber': phoneNumber,
      'token':code
    })
  );

  jsonData = json.decode(response.body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  print(jsonData);
  if(response.statusCode == 200 && jsonData['succeeded']){
    //preferences.setString('token', jsonData['data']['jwtToken']);
    var user = jsonData['data']['user'];
    print(user);
    User loggedUser = User(
      hairType: user['hairType'],
      lastname: user['lastname'],
      firstname: user['firstname'],
      email: user['email'],
      phoneNumber: user['phoneNumber'],
      gender: user['gender'],
      pictureUrl: user['pictureUrl'],
      commandCount: user['commandCount'],
      status: user['status'],
      addresses: user['addresses']
    );*/
    //print(loggedUser.phoneNumber);
    Navigator.pushNamedAndRemoveUntil(context, "/homepage", (route) => false);
    //}
  }
}


