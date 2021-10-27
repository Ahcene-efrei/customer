import 'package:flutter/material.dart';
import 'package:customer/components/profil/profil_pic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paramètres"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ProfilPic(),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10
            ),
            child: Column(
              children: [
                Text(
                  'Durand zin',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Modifier le compte",
                  style: const TextStyle(
                color: Color.fromRGBO(39, 61, 8, 1)
                )
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
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
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lieux enregistrés",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                FlatButton(
                    padding: EdgeInsets.all(20),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                              Icon(Icons.home_outlined,
                              size: 30,
                              ),
                            ]
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Domicile",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Text("25 rue de la république, 75010 Paris",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54
                              ),
                            )
                          ],
                        )
                      ],
                    )
                ),
                FlatButton(
                    padding: EdgeInsets.all(20),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                              Icon(Icons.work_outline,
                                size: 30,
                              ),
                            ]
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Travail",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Text("Ajouter une adresse professionnelle",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54
                              ),
                            )
                          ],
                        )
                      ],
                    )
                )
              ],
            )
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FlatButton(
                  onPressed: (){},
                  child: Text("Autres options",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                FlatButton(
                  onPressed: (){},
                  child: Text("Se déconnecter",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(39, 61, 8, 1)
                    ),
                  ),
                )
              ],
            )


          ],
        )
        ]
      )
    );
  }

}