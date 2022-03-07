import 'dart:html';

import 'package:customer/data/enums/genre.dart';
import 'package:customer/data/enums/hairtype.dart';
import 'package:customer/data/enums/producttype.dart';
import 'package:customer/data/json/parameterJson.dart';
import 'package:customer/data/models/search_parameters.dart';
import 'package:customer/presentation/screens/search/filter_genre_page.dart';
import 'package:customer/presentation/screens/search/filter_hairType_page.dart';
import 'package:customer/presentation/screens/search/filter_productType_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class FilterScreen extends StatefulWidget {
  SearchParameters params;
  Function setParams;
  FilterScreen({Key? key, required this.params, required this.setParams}) : super(key: key);
  @override
  _FilterScreenState createState() => _FilterScreenState();


}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Filtres"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: ()=>{

              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return FilterHairTypeScreen(currentHairType: widget.params.hairType,setHairType: setHairType,);
              }),)
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),

              child: Row(
                children: [
                  SvgPicture.asset(
                    "lib/assets/images/female-hairs.svg",
                    width: 50,
                    color: Colors.black87,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Type de cheuveux",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.black87,
                              ),
                              Expanded(
                                  child: Text(
                                    getHairTypeText(widget.params.hairType),
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 12
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: ()=>{

              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return FilterProductTypeScreen(currentProductType: widget.params.productType, setProductType: setProductType,);
              }),)
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),

              child: Row(
                children: [
                  Image.asset(
                    "lib/assets/images/product.png",
                    width: 50,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Type de produits",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.black87,
                              ),
                              Expanded(
                                  child: Text(
                                    getProductTypeText(widget.params.productType),
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: ()=>{

              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return FilterGenreScreen(currentGenre: widget.params.gender,setGenre: setGenre,);
              }),)
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),

              child: Row(
                children: [
                  Image.asset(
                    "lib/assets/images/genre.png",
                    width: 50,
                    color: Colors.black87,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Genre du coiffeur",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.black87,
                              ),
                              Expanded(
                                  child: Text(
                                    getGenreText(widget.params.gender),
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Text("Prix : ",
              style: TextStyle(fontWeight: FontWeight.bold),),
              RangeSlider(
                divisions: 25,
                activeColor: Colors.red[700],
                inactiveColor: Colors.red[300],
                min: 1,
                max: 500,
                values: RangeValues(widget.params.minPrice, widget.params.maxPrice),
                labels: RangeLabels("${widget.params.minPrice.toString()}\€", "${widget.params.maxPrice.toString()}\€"),
                onChanged: (value){
                  setState(() {
                    // widget.values =value;
                    // widget.labels =RangeLabels("${value.start.toInt().toString()}\€", "${value.end.toInt().toString()}\€");
                    setPrices(value.start.toInt(), value.end.toInt());
                  });
                }
              ),
              Text("${widget.params.minPrice.toDouble().toString()}\€ à ${widget.params.maxPrice.toDouble().toString()}\€",
                style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),
    );
  }
  void setHairType(HairType type){
    setState(() {
      widget.params.hairType = type;
    });
    widget.setParams(widget.params);
  }

  String getHairTypeText(HairType type){
    return ListHairType.firstWhere((element) => element['value'] == type)['text'].toString();
  }

  void setProductType(ProductType type){
    setState(() {
      widget.params.productType = type;
    });
    widget.setParams(widget.params);
  }

  String getProductTypeText(ProductType type){
    return ListProductType.firstWhere((element) => element['value'] == type)['text'].toString();
  }

  void setGenre(Genre type){
    setState(() {
      widget.params.gender = type;
    });
    widget.setParams(widget.params);
  }

  String getGenreText(Genre type){
    return ListGenre.firstWhere((element) => element['value'] == type)['text'].toString();
  }

  void setPrices(min, max){
    widget.params.minPrice = min;
    widget.params.maxPrice = max;
    widget.setParams(widget.params);
  }
}


