
import 'package:customer/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Prestation extends StatelessWidget {
  var prestation;


  Prestation(prestation, {
    Key? key,
  }):this.prestation = prestation, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.all(8.0),
            textColor: Colors.white,
            splashColor: AppColors.primary,
            elevation: 8.0,
            child: Opacity(opacity: 0.7,
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(
                          //categories[index]['img']
                          "lib/assets/images/barber.jpg",
                          fit: BoxFit.cover,
                        ).image,
                        fit: BoxFit.cover),
                    borderRadius: new BorderRadius.all(Radius.circular(5))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(prestation['name']),
                ),
              ),
            ),
            // ),
            onPressed: () {
              print('Tapped');
            },
          ),
        ],
      ),
    );
  }
}