import 'package:customer/components/button/button.dart';
import 'package:customer/presentation/screens/hairdresser/booking_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:customer/data/json/home_page_json.dart';
import 'package:customer/data/models/hairdresser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer/data/models/product.dart';

class HairdresserProfil extends StatefulWidget {
  final Hairdresser currentHairdresser;
  const HairdresserProfil({Key? key, required this.currentHairdresser}) : super(key: key);

  @override
  _HairdresserProfilState createState() => _HairdresserProfilState();
}

class _HairdresserProfilState extends State<HairdresserProfil> {
  List<Product> listProducts = [
    Product(name: "coupe homme", price: 11.50),
    Product(name: "coupe femme", price: 33.99),
    Product(name: "coupe simple", price: 10.99),
    Product(name: "coupe complexe", price: 25.00),
  ];
  var listTest = [1,2,3,4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }


  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 150,
                  color: Colors.amber,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                  //decoration: BoxDecoration(
                   //   image: DecorationImage(
                   //       image: NetworkImage(widget.img), fit: BoxFit.cover)),
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 18,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.favorite_border,
                              size: 18,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.currentHairdresser.getFirstName()} ${widget.currentHairdresser.lastname}",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: size.width - 30,
                        child: Text(
                          "description coiffeur",
                          style: TextStyle(fontSize: 14, height: 1.3),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.hourglass_bottom,
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "40-50 Min",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(
                                  "3.5",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.black,
                                  size: 17,
                                ),
                                Text(
                                  "(16)",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Store Info",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: (size.width) * 0.80,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "lib/assets/images/pin_icon.svg",
                              width: 15,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${widget.currentHairdresser.address!.address1}, ${widget.currentHairdresser.address!.city}",
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "More Info",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.3),
                  ),

                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   padding: const EdgeInsets.all(8),
                  //   itemCount: listProducts.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return InkWell(
                  //       onTap: ()=>{
                  //         Navigator.push(context, MaterialPageRoute(
                  //           builder: (context) => BookingPage(product:listProducts[index]),
                  //         ))
                  //       },
                  //       child: Card(
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(5)
                  //         ),
                  //
                  //         child: Row(
                  //           children: [
                  //             Container(
                  //               height: 60,
                  //               width: 60,
                  //               color: Colors.blueGrey,
                  //               child: Icon(
                  //                 Icons.shopping_cart_outlined,
                  //                 size: 40,
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //             Flexible(
                  //               child: Padding(
                  //                 padding: const EdgeInsets.all(15.0),
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text(
                  //                       listProducts[index].getName(),
                  //                       overflow: TextOverflow.ellipsis,
                  //                       style: TextStyle(
                  //                           fontSize: 18,
                  //                           fontWeight: FontWeight.bold
                  //                       ),
                  //                     ),
                  //                     SizedBox(height: 7),
                  //                     Text("test"),
                  //                     SizedBox(height: 7),
                  //                     Text(
                  //                       "${listProducts[index].price.toString()} €",
                  //                       style: TextStyle(
                  //                           fontSize: 18
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   }
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,50),
                      child: Button(
                        text: "Réserver",
                        callBack: ()=>{
                          Navigator.push(context, MaterialPageRoute(builder: (ctx){
                            return BookingPage(currentHairdresser: widget.currentHairdresser,);
                          }),)
                        }
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
