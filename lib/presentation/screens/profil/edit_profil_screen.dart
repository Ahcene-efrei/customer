import 'package:flutter/material.dart';
import 'package:customer/components/profil/profil_pic.dart';

class EditProfilScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Modifier le compte"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilPic(),
              SizedBox(
                height: 20,
              ),
              Container(
                child:
                const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                ),
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  border: InputBorder.none,


                ),
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  border: InputBorder.none,

                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  padding: EdgeInsets.all(20),
                  color: Colors.black87,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enregistrer",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }

}