import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:customer/presentation/screens/history/history_screen.dart';
import 'package:customer/styles/String.dart';
import 'package:customer/styles/images.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paniers"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(""),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: _cartView(context),
              )
            )
          )
        ]
      )
    );
  }

  _cartView(BuildContext context) {
    return _NotEmptyCart(context);
  }

  _NotEmptyCart(context){
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                    //backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                  ),
                  onPressed: () => HistoryScreen().onButtonPressed(context),
                  child:  Container(
                    height: 100,
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.only(right: 5),
                          child: CircleAvatar(
                            child:
                            SvgPicture.string(barber),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Moussa",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.black
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Paris 19",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.black
                                    )
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("Coupe simple 10€",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.black
                                    )
                                )
                              ],
                            )
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0x737373))
                ),
                onPressed: () {},
                child: Icon(Icons.delete),),
            )

          ],
        )
      ],
    );
  }

  _emptyCart(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: SvgPicture.string(empty_cart, width: 200, height: 200,),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ajouter une coupe pour commencer un pannier."),
              Text("Une fois que vous avez ajouté des prestations d'un coiffeur votre panier s'affiche ici."),
            ],
          ),
        ),
        Container(
          width: 100,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
              ),
              //height: 10,
              onPressed: () => {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(
                  booking,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                ],
              )
          ),
        )
      ],
    );
  }

}

