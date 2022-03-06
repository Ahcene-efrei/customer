import 'dart:html';

import 'package:customer/data/enums/hairtype.dart';
import 'package:customer/data/json/parameterJson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterHairTypeScreen extends StatefulWidget {
  HairType currentHairType;
  Function setHairType;
  FilterHairTypeScreen({Key? key, required this.currentHairType, required this.setHairType}) : super(key: key);

  @override
  _FilterHairTypeScreenState createState() => _FilterHairTypeScreenState();
}

class _FilterHairTypeScreenState extends State<FilterHairTypeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    print(widget.currentHairType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getHairTypeCards(widget.currentHairType, context),
    );
  }

  Column getHairTypeCards(HairType type, context){

    List<Widget> list = [];
    List<Row> listOfRows = [];
    for(var i = 0; i < ListHairType.length; i++){
      if(i > 0 && i%3 == 0){
        // print(i);
        // [...listOfRows, new Row(children: list)];
        listOfRows.add(new Row(children: list));
        list = [];
      }
      list.add(getCard(ListHairType[i]['text'], ListHairType[i]['value'], context, ListHairType[i]['url']));
      // print(list);
      // [...list, getCard(ListHairType[i]['text'], ListHairType[i]['value'])];

    }
    listOfRows.add(new Row(children: list));
    return new Column(children: listOfRows);

  }

  Widget getCard(text, value, context, url){
    return new Expanded(
        child: InkWell(
          onTap: ()=>{
            widget.setHairType(value),
            Navigator.pop(context)
            // Navigator.push(context, MaterialPageRoute(builder: (ctx){
            //   return FilterHairTypeScreen(currentHairType: widget.params.hairType,);
            // }),)

          },
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: url == '' ? Center(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ) : Image.asset(
              url,
              fit: BoxFit.fill,
            ),
            elevation: value.index == widget.currentHairType.index ? 0 : 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: value.index == widget.currentHairType.index ? Colors.black87 : Colors.white,
                width: value.index == widget.currentHairType.index ? 3.0 : 0.0,
              ),
            ),
            // color: value.index == widget.currentHairType.index ? Colors.black12 : Colors.white,
            // child: Center(
            //   child: Text(
            //     text,
            //     overflow: TextOverflow.ellipsis,
            //     style: TextStyle(
            //         fontSize: 10,
            //         fontWeight: FontWeight.bold
            //     ),
            //   ),
            // ),
          ),
        )
    );
  }
}

