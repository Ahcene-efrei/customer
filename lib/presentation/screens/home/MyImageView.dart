import 'package:customer/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyImageView extends StatelessWidget{

  String imgPath = "lib/assets/images/barber.jpg";

  MyImageView(this.imgPath);

  String getImgPath(){
    return this.imgPath;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Builder(
      builder: (BuildContext context) {
        return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(12.0),
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                color: Colors.black
            ),
            child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(this.imgPath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Les meilleurs coiffeurs",
                          style: customContentWhite,
                          ),
                          Text("La belle coupe",
                          style: customContent,
                          ),
                          ElevatedButton(
                              onPressed: (){},
                              style: btnStyleDefault,
                              child: Text('Voir plus'))
                        ],
                      )
                  ),
                ]
            ),
        );
      },
    );
  }

}