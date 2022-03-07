
import 'package:customer/data/models/hairdresser.dart';
import 'package:customer/presentation/screens/hairdresser/HairdresserProfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class InfinitScrollShow extends StatelessWidget{
  final PagingController<int, Hairdresser> _pagingController;
  final storage = new FlutterSecureStorage();
  final dio = Dio();
  final axis;

  static const _pageSize = 10;
  String? search_text;
  String? token;

  InfinitScrollShow(this._pagingController, this.axis);

  @override
  Widget build(BuildContext context) {
    return showResult();
  }

  Widget showResult(){
    return PagedListView<int, Hairdresser>(
      pagingController: _pagingController,
      shrinkWrap: true,
      builderDelegate: PagedChildBuilderDelegate<Hairdresser>(
          itemBuilder: (context, item, index) => InkWell(
            onTap: ()=>{
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => HairdresserProfil(currentHairdresser: item),
              ),)
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.amber,
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
            ),
          ),
      ),
      scrollDirection: this.axis
    );
  }
  Future<void> setToken() async {
    token = await storage.read(key: "jwt");
  }

}