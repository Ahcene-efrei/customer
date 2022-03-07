import 'dart:convert';
import 'dart:ui';

import 'package:customer/data/api/error_exception.dart';
import 'package:customer/data/api/hairdresser_api.dart';
import 'package:customer/data/models/search_parameters.dart';
import 'package:customer/presentation/screens/search/filter_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:customer/data/json/home_page_json.dart';
import 'package:customer/data/models/hairdresser.dart';
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
  SearchParameters parameters = new SearchParameters();
  String? token;
  final PagingController<int, Hairdresser> _pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    // setToken();
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
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                "lib/assets/images/filter_icon.svg",
                color: Colors.white70,
                fit: BoxFit.fitWidth,
              ),
              onPressed: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return FilterScreen(params: parameters, setParams: setParams);
                }),)
              },
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

  void setParams(newParams){
    setState(() {
      parameters = newParams;
    });
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
                            "${item.firstname} ${item.lastname}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Icon(
                                  Icons.location_on,
                                  size: 20,
                                  color: Colors.amber,
                                ),
                              ),
                              Expanded(
                                  flex: 6,
                                  child: Text("${item.address!.address1}, ${item.address!.city}")
                              ),
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
        parameters.name = search_text;
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
        try{
          var response = await HairdresserApi().getListHairdresser(parameters);
          newItems = (response["data"]['items'] as List)
              .map((x) => Hairdresser().fromJson(x))
          //.where((x) => x.firstname.toLowerCase().contains(search_text!))
              .toList();
        }on Exception catch (_) {
          print("code error");
        }
        // final response = await widget.dio.get("https://api.instantwebtools.net/v1/passenger",
        //     queryParameters: {
        //       "page" : pageKey,
        //       "size": _pageSize,
        //     }
        // );

      }

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        parameters.pageNumber = nextPageKey;
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

// Future<void> setToken() async {
//   token = await widget.storage.read(key: "jwt");
// }
}