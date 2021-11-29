import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer/data/models/Product.dart';

class BookingPage extends StatelessWidget {
  final Product product;
  const BookingPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              product.price.toString(),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40,0,40,50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, // This is what you need!
                  padding: const EdgeInsets.all(15)
              ),
              onPressed: (){
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(
                    'Reserver  ${product.price} €',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

