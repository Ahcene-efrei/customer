import 'package:flutter/material.dart';import 'package:flutter/material.dart';

class BookingsRequestScreen extends StatelessWidget{
  const BookingsRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Toutes';
    return Scaffold(
        appBar: AppBar(
          title: Text("Réservation"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                        color: Colors.black54
                    ),
                    onChanged: (newValue){
                      print(newValue);
                    },
                    underline: Container(
                      height: 2,
                      color: Colors.black54,
                    ),
                    items: <String>['Toutes', 'En attentes', 'Acceptées', 'Réfusées']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
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
                                )
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlatButton(
                                    color: Colors.lightGreen,
                                    onPressed: () {},
                                    child: Row(
                                      children: [Text(
                                        "Acceptée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                      ],
                                    )
                                ),
                                SizedBox(width: 20),
                                FlatButton(
                                  color: Colors.blueGrey,
                                  onPressed: () {},
                                  child: Row(
                                      children: [Text(
                                        "Réfusée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),]
                                  ),
                                )
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
                                )
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlatButton(
                                    color: Colors.lightGreen,
                                    onPressed: () {},
                                    child: Row(
                                      children: [Text(
                                        "Acceptée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                      ],
                                    )
                                ),
                                SizedBox(width: 20),
                                FlatButton(
                                  color: Colors.blueGrey,
                                  onPressed: () {},
                                  child: Row(
                                      children: [Text(
                                        "Réfusée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),]
                                  ),
                                )
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
                                )
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlatButton(
                                    color: Colors.lightGreen,
                                    onPressed: () {},
                                    child: Row(
                                      children: [Text(
                                        "Acceptée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                      ],
                                    )
                                ),
                                SizedBox(width: 20),
                                FlatButton(
                                  color: Colors.blueGrey,
                                  onPressed: () {},
                                  child: Row(
                                      children: [Text(
                                        "Réfusée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),]
                                  ),
                                )
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
                                )
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlatButton(
                                    color: Colors.lightGreen,
                                    onPressed: () {},
                                    child: Row(
                                      children: [Text(
                                        "Acceptée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                      ],
                                    )
                                ),
                                SizedBox(width: 20),
                                FlatButton(
                                  color: Colors.blueGrey,
                                  onPressed: () {},
                                  child: Row(
                                      children: [Text(
                                        "Réfusée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),]
                                  ),
                                )
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
                                )
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlatButton(
                                    color: Colors.lightGreen,
                                    onPressed: () {},
                                    child: Row(
                                      children: [Text(
                                        "Acceptée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                      ],
                                    )
                                ),
                                SizedBox(width: 20),
                                FlatButton(
                                  color: Colors.blueGrey,
                                  onPressed: () {},
                                  child: Row(
                                      children: [Text(
                                        "Réfusée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),]
                                  ),
                                )
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
                                )
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlatButton(
                                    color: Colors.lightGreen,
                                    onPressed: () {},
                                    child: Row(
                                      children: [Text(
                                        "Acceptée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                      ],
                                    )
                                ),
                                SizedBox(width: 20),
                                FlatButton(
                                  color: Colors.blueGrey,
                                  onPressed: () {},
                                  child: Row(
                                      children: [Text(
                                        "Réfusée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),]
                                  ),
                                )
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
                                )
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FlatButton(
                                    color: Colors.lightGreen,
                                    onPressed: () {},
                                    child: Row(
                                      children: [Text(
                                        "Acceptée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                      ],
                                    )
                                ),
                                SizedBox(width: 20),
                                FlatButton(
                                  color: Colors.blueGrey,
                                  onPressed: () {},
                                  child: Row(
                                      children: [Text(
                                        "Réfusée",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),]
                                  ),
                                )
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

}