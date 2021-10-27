import 'package:flutter/material.dart';
import 'package:customer/components/profil/profil_menu.dart';
import 'package:customer/components/profil/profil_pic.dart';

class ProfilScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profil"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ProfilPic(),
            SizedBox(
              height: 20,
            ),
            ProfilMenu()
          ],
        )
    );
  }
  
}