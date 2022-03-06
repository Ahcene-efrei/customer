import 'dart:html';

import 'package:customer/data/enums/hairtype.dart';
import 'package:customer/data/enums/producttype.dart';
import 'package:customer/data/json/parameterJson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterProductTypeScreen extends StatefulWidget {
  ProductType currentProductType;
  Function setProductType;
  FilterProductTypeScreen({Key? key, required this.currentProductType, required this.setProductType}) : super(key: key);

  @override
  _FilterProductTypeScreenState createState() => _FilterProductTypeScreenState();
}

class _FilterProductTypeScreenState extends State<FilterProductTypeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    print(widget.currentProductType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getHairTypeCards(widget.currentProductType, context),
    );
  }

  Column getHairTypeCards(ProductType type, context){

    List<Widget> list = [];
    List<Row> listOfRows = [];
    for(var i = 0; i < ListProductType.length; i++){
      if(i > 0 && i%3 == 0){
        // print(i);
        // [...listOfRows, new Row(children: list)];
        listOfRows.add(new Row(children: list));
        list = [];
      }
      list.add(getCard(ListProductType[i]['text'], ListProductType[i]['value'], context));

    }
    listOfRows.add(new Row(children: list));
    return new Column(children: listOfRows);

  }

  Widget getCard(text, value, context){
    return new Expanded(
        child: InkWell(
          onTap: ()=>{
            widget.setProductType(value),
            Navigator.pop(context)
            // Navigator.push(context, MaterialPageRoute(builder: (ctx){
            //   return FilterHairTypeScreen(currentHairType: widget.params.hairType,);
            // }),)

          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            color: value.index == widget.currentProductType.index ? Colors.black12 : Colors.white,
            child: Center(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        )
    );
  }
}

