import 'package:customer/components/button/button.dart';
import 'package:customer/styles/colors.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SecondaryColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Inscription',
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
                    "Nouvel utilisateur",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Button(
                  text: 'Continuer',
                  callBack: ()=> Navigator.pushNamedAndRemoveUntil(context, "/register", (route) => false)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
