import 'package:flutter/material.dart';
import 'package:customer/styles/String.dart';

class HistoryScreen extends StatelessWidget{
  const HistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Toutes';
    String booking_again = 'Réserver à nouveau';
    String show_barber = "Afficher";
    return Scaffold(
        appBar: AppBar(
          title: Text("Vos commandes"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Anciennes commandes")
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 100,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white70
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Image.asset('assets/images/img.png'),
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
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Paris 19")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Coupe simple 10€")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("15/07/2021 Terminée")
                                    ],
                                  )
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlatButton(
                                      color: Colors.blueGrey,
                                      onPressed: () => onButtonPressed(context),
                                      child: Row(
                                        children: [Text(
                                          booking_again,
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        ),
                                        ],
                                      )
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white70
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Image.asset('assets/images/img.png'),
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
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Paris 19")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Coupe simple 10€")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("15/07/2021 Annulée")
                                    ],
                                  )
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlatButton(
                                      color: Colors.blueGrey,
                                      onPressed: () => onButtonPressed(context),
                                      child: Row(
                                        children: [Text(
                                          booking_again,
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        ),
                                        ],
                                      )
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white70
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Image.asset('assets/images/img.png'),
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
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Paris 19")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Coupe simple 10€")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("15/07/2021 Terminée")
                                    ],
                                  )
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FlatButton(
                                      color: Colors.blueGrey,
                                      onPressed: () {},
                                      child: Row(
                                        children: [Text(
                                          show_barber,
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        ),
                                        ],
                                      )
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ]
                  ),
                )
            )
          ],
        )
    );
  }

  onButtonPressed(context) {
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        color: Color(0xFF737373),
        //height: 30,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(10),
              topRight: const Radius.circular(10)
            )
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        child: Divider(
                          color: Color(0xFFE2E2E2),
                          thickness: 5,
                          height: 1,
                        ),
                        width: 50,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Text("Moussa barber"),
                      )
                    ],
                  )

                ],
              ),
              Divider(
                  color: Colors.black
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("Paris 19")
                        ],
                      ),
                      Row(
                        children: [
                          Text("Coupe simple")
                        ],
                      )
                    ],
                  ),
                  Text("10€")
                ],
              ),
              Divider(
                  color: Colors.black
              ),
              Row(
                children: [

                ],
              ),
              Container(
                child: FlatButton(
                  height: 50,
                  color: Color(0xFFE2E2E2),
                  onPressed: () => _addRemark(context),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        add_remark,
                        style: TextStyle(
                            color: Colors.black
                        ),
                      ),
                      Icon(Icons.add_sharp)
                    ],
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(sub_total),
                    Text("12,9€"),
                  ],
                ),
              ),
              FlatButton(
                height: 50,
                color: Colors.blueGrey,
                onPressed: () => onButtonPressed(context),
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
            ],
          ),
        )
      );
    });
  }
}

_addRemark(BuildContext context) {

}