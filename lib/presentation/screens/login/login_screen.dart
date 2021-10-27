import 'dart:ui';

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Saisissez votre numéro de téléphone portable",
                    style: TextStyle(
                      fontSize: 24
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0,10),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        currentPhoneNumber = number.phoneNumber!;
                      },
                      onInputValidated: (bool value) {
                        isValid = value;
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
                      fontSize: 14,
                      color: Colors.grey[600]
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, // This is what you need!
                      padding: const EdgeInsets.all(15)
                  ),
                  onPressed: (){
                    if(isValid){
                      //Navigator.pushNamed(context, "/code");

                      sendPhoneNumber(currentPhoneNumber, context);
                    }else{
                    }

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Continuer",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

Future<void> sendPhoneNumber(String phoneNumber, BuildContext context) async {
  print("test");
  //var url = Uri.parse('https://labonnecoupe.azurewebsites.net/api/Customer/SendVerificationToken');
  //var response = await http.post(url, body: {'phoneNumber': phoneNumber});
  print('numéros de tél: ${phoneNumber}');
  //print('Response status: ${response.statusCode}');
  //print('Response body: ${response.body}');

  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CodePage(phoneNumber: phoneNumber),
    ));

}
