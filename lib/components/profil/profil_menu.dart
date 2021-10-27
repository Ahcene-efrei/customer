import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilMenu extends StatelessWidget{
  const ProfilMenu({
    Key? key,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
        ),
        child: Column(
          children: [
            FlatButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.heart),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text("Vos favoris"),
                    ),
                  ],
                )
            ),
            FlatButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.star),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text("Programme de fidélité Coiffeur"),
                    ),
                  ],
                )
            ),
            FlatButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.creditCard),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text("Wallet"),
                    ),
                  ],
                )
            ),
            FlatButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.lifeRing),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text("Aide"),
                    ),
                  ],
                )
            ),
            FlatButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.cog),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text("Paramètres"),
                    ),
                  ],
                )
            ),
            FlatButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.signOutAlt),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text("Se déconnecter"),
                    ),
                  ],
                )
            ),
            FlatButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text("À propos"),
                    ),
                  ],
                )
            ),
          ],
        )

    );
  }

}
