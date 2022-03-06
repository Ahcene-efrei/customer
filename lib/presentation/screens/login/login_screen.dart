import 'dart:ui';

import 'package:customer/components/button/button.dart';
import 'package:customer/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:http/http.dart' as http;
import 'package:customer/presentation/screens/login/code_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isValid = false;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'FR';
  PhoneNumber number = PhoneNumber(isoCode: 'FR');
  String currentPhoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Connexion',
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
                children: [
                  Text(
                    "Saisissez votre numéro de téléphone portable",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0,15),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        currentPhoneNumber = number.phoneNumber!;
                      },
                      onInputValidated: (bool value) {
                        isValid = true;
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: controller,
                      formatInput: false,
                      keyboardType:
                      TextInputType.numberWithOptions(signed: true, decimal: true),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
                  Text(
                    "Si vous continuez, vous recevrez peut-être un SMS de vérification. Des frais de messagerie SMS et de transfert de données peuvent s'appliquer.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600]
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,50),
                child: Button(text: "Continuer", callBack: ()=>sendPhoneNumber(isValid, currentPhoneNumber, context))
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> sendPhoneNumber(bool isValid, String phoneNumber, BuildContext context) async {
  print(isValid);
  if(isValid){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CodePage(phoneNumber: phoneNumber),
      )
    );
  }


}
