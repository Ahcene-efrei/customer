import 'dart:html';

import 'package:customer/data/enums/genre.dart';
import 'package:customer/data/enums/hairtype.dart';
import 'package:customer/data/enums/producttype.dart';
import 'package:customer/data/json/parameterJson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterGenreScreen extends StatefulWidget {
  Genre currentGenre;
  Function setGenre;
  FilterGenreScreen({Key? key, required this.currentGenre, required this.setGenre}) : super(key: key);

  @override
  _FilterGenreScreenState createState() => _FilterGenreScreenState();
}

class _FilterGenreScreenState extends State<FilterGenreScreen> {

  @override
  void initState() {
    // TODO: implement initState
    print(widget.currentGenre);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getHairTypeCards(widget.currentGenre, context),
    );
  }

  Column getHairTypeCards(Genre type, context){

    List<Widget> list = [];
    List<Row> listOfRows = [];
    for(var i = 0; i < ListGenre.length; i++){
      if(i > 0 && i%2 == 0){
        // print(i);
        // [...listOfRows, new Row(children: list)];
        listOfRows.add(new Row(children: list));
        list = [];
      }
      list.add(getCard(ListGenre[i]['text'], ListGenre[i]['value'], context));

    }
    listOfRows.add(new Row(children: list));
    return new Column(children: listOfRows);

  }

  Widget getCard(text, value, context){
    return new Expanded(
        child: InkWell(
          onTap: ()=>{
            widget.setGenre(value),
            Navigator.pop(context)
            // Navigator.push(context, MaterialPageRoute(builder: (ctx){
            //   return FilterHairTypeScreen(currentHairType: widget.params.hairType,);
            // }),)

          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            color: value.index == widget.currentGenre.index ? Colors.black12 : Colors.white,
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

