import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:customer/data/json/home_page_json.dart';
import 'package:customer/data/models/Hairdresser.dart';
import 'package:customer/presentation/screens/hairdresser/HairdresserProfil.dart';


class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  final dio = Dio();
  final storage = new FlutterSecureStorage();
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static const _pageSize = 10;
  String? search_text;
  String? token;
  final PagingController<int, Hairdresser> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    setToken();
    print("test");
    _pagingController.addPageRequestListener((pageKey) {
      search(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: getAppBar(),
      body: search_text != null && search_text != '' ? showResult() : Container()
    );
  }


  PreferredSizeWidget getAppBar(){
    return AppBar(
      backgroundColor: Colors.black87,
      elevation: 0,
      title: Container(
        height: 45,
        width: double.infinity,
        child: TextField(
          style: TextStyle(
            color: Colors.white70
          ),
          cursorColor: Colors.white70,
          decoration: InputDecoration(
            hintText: "Coupes, Coiffeurs, Catégories, ...",
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: Colors.white70
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white70
            ),
          ),
          onSubmitted: (text)=>{
            print("Submitted : "+text)
          },
          onEditingComplete: ()=>{
            print("onEditingComplete : ")
          },
          onTap: ()=>{
            print("TAP")
          },
          onChanged: (value)=>{
            _updateSearchTerm(value)
          },
        ),
      ),
    );
  }

  Widget showResult(){
    return PagedListView<int, Hairdresser>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Hairdresser>(
        itemBuilder: (context, item, index) => InkWell(
          onTap: ()=>{
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HairdresserProfil(currentHairdresser: item),
            ),)
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),

            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.firstname,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.amber,
                            ),
                            Text("34 rue dcssdf qsdqs 93843 AZqskswd"),
                          ],
                        ),
                        SizedBox(height: 7),
                        RatingBarIndicator(
                          rating: 3.5,
                          itemSize: 15,
                          itemBuilder: (context, index){
                            return Icon(
                              Icons.star,
                              color: Colors.amber,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }


  Future<void> search(int pageKey) async{
    print("search");
    try {
      List<Hairdresser> newItems = [];
      print(search_text);
      if(search_text != null && search_text != ''){
        print("-----");
        //final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
        //final newItems = listOfHairdresser;
        /*widget.dio.options.headers['content-Type'] = 'application/json';
        widget.dio.options.headers["authorization"] = "Bearer ${token}";
        print(pageKey);
        final response = await widget.dio.get(
            "https://labonnecoupe.azurewebsites.net/api/Hairdresser/GetAllWithPagination",
            queryParameters: {
              "pageNumber" : pageKey,
              "pageSize": _pageSize
            }
        ).catchError((error){
          print(error.response);
        });*/
        final response = await widget.dio.get("https://api.instantwebtools.net/v1/passenger",
            queryParameters: {
              "page" : pageKey,
              "size": _pageSize
            }
        );
        print(response);
        newItems = (response.data["data"] as List)
            .map((x) => Hairdresser(firstname: x["name"]))
            //.where((x) => x.firstname.toLowerCase().contains(search_text!))
            .toList();
      }

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  void _updateSearchTerm(String searchTerm) {
    print("_updateSearchTerm");
    if(search_text != searchTerm){
      setState(() {
        search_text = searchTerm;
      });
      _pagingController.refresh();
    }
  }

  Future<void> setToken() async {
    token = await widget.storage.read(key: "jwt");
  }
}

