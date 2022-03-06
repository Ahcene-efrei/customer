import 'dart:convert';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:customer/components/home/barber_cycle.dart';
import 'package:customer/components/home/prestation.dart';
import 'package:customer/presentation/screens/home/MyImageView.dart';
import 'package:customer/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:customer/data/json/home_page_json.dart';
import 'package:customer/styles/theme.dart';
import 'package:customer/presentation/screens/home/search_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:customer/components/home/infinit_scroll_show.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:customer/data/models/hairdresser.dart';
import 'package:dio/dio.dart';





class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  final dio = Dio();
  final storage = new FlutterSecureStorage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _pageSize = 10;
  int selectedTypeOfLocation = 0;
  bool cpt_tap = true;

  String? token;
  // final PagingController<int, Hairdresser> _pagingController = PagingController(firstPageKey: 0);
  // late InfinitScrollShow infinitScrollShow;

  void initState() {
    // infinitScrollShow = new InfinitScrollShow(_pagingController, Axis.vertical);
    // infinitScrollShow.setToken();
    // _pagingController.addPageRequestListener((pageKey) {
    //   // search(pageKey);
    // });
    super.initState();
  }

  @override
  void dispose() {
    // _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }


  Widget getBody(){
    var size = MediaQuery.of(context).size;
    int currentPos = 0;
    List<String> listPaths = [
      "lib/assets/images/barber.jpg",
      "lib/assets/images/slide_1.jpg",
      "lib/assets/images/slide_2.jpg"
    ];
    return
      ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ColoredBox(
              color: Colors.black,
              child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    getLocationWidget(size),
                    SizedBox(
                      height: 15,
                    ),
                    selectTypeOfLocation(),
                    SizedBox(
                      height: 15,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250,
                        aspectRatio: 16/9,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPos = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      items: listPaths.map((i) {
                        return MyImageView(i);
                      }).toList(),
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listPaths.map((url) {
                        int index = listPaths.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPos == index
                                ? Color.fromRGBO(255, 255, 255, 0.9)
                                : Color.fromRGBO(222, 215, 215, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ]
              ),
            ),
            getCategories(size),
            SizedBox(
              height: 15,
            ),
            selectedTypeOfLocation == 0 ? getADomicile(size) : getEnSalon(size),
            SizedBox(
              height: 15,
            ),
            Container(
              width: size.width,
              height: 10,
              decoration: BoxDecoration(color: Colors.black12),
            ),
            SizedBox(
              height: 20,
            ),
            // infinitScrollShow.showResult(),
            FlatButton(
              onPressed: () {
                _updateSearchTerm();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Charger plus",
                      style: textprimary),
                  Icon(
                    Icons.add,
                    color: AppColors.primary,
                    size: iconSizeDefault,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }


  Row getLocationWidget(size){
    return Row(
      children: [
        InkWell(
          onTap: ()=>{print("select position")},
          child: Container(
            margin: EdgeInsets.only(
              left: 15,
            ),
            height: 45,
            width: size.width - 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "lib/assets/images/pin_icon.svg",
                        width: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Ma position", style: customContent,)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "lib/assets/images/time_icon.svg",
                            width: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Maintenant",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: IconButton(
              icon: SvgPicture.asset(
                "lib/assets/images/search_icon.svg",
                color: Colors.white,
              ),
              onPressed: ()=>{
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  )
                )

              },
            ),
          ),
        )
      ],
    );
  }


  Row selectTypeOfLocation(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(TypeOfLocation.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedTypeOfLocation = index;
              });
            },
            child: selectedTypeOfLocation == index
            ? ElasticIn(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 8, bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        TypeOfLocation[index],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            )
            : Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 8, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      TypeOfLocation[index],
                      style: customContentWhite,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  
  Container getCategories(size){
    return Container(
      width: size.width,
      decoration: BoxDecoration(color: Colors.black12),
      child: Padding(
        padding: EdgeInsets.only(top: 3, bottom: 3),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prestations",
                      style: customTitle,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "YourRoute");
                      },
                      child: Row(
                        children: [
                          Text("Voir plus",
                          style: textprimary),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.primary,
                            size: iconSizeDefault,
                          )
                        ],
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                      children: categories.map((prestation) => Prestation(prestation)).toList(),
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }


  Container getADomicile(size){
    return Container(
      width: size.width,
      child: Column(
        children: [
          Padding(
          padding: const EdgeInsets.only(left: 13),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Les meilleurs coiffeurs proches",
                style: customTitle,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "YourRoute");
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primary,
                    size: iconSizeDefault,
                  )
              )
            ],
          ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:
                  Row(
                    children: listOfHairdresser.map((hairdresser) => BarberCycle(hairdresser)).toList(),
                  ),
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //Navigator.push(
                        //    context,
                        //   MaterialPageRoute(
                        //       builder: (_) => StoreDetailPage(
                        //         img: firstMenu[0]['img'],
                        //       )));
                      },
                      child: Container(
                        width: size.width,
                        height: 160,
                        child: Image(
                          image: NetworkImage(firstMenu[0]['img']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: SvgPicture.asset(
                        firstMenu[0]['is_liked']
                            ? "lib/assets/images/loved_icon.svg"
                            : "lib/assets/images/love_icon.svg",
                        width: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  firstMenu[0]['name'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Sponsored",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.info,
                      color: Colors.grey,
                      size: iconSizeDefault,
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      firstMenu[0]['description'],
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
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
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          firstMenu[0]['time'],
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
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          firstMenu[0]['delivery_fee'],
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container getEnSalon(size){
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Les salons proche de moi",
            style: customTitle,
          ),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(exploreMenu.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              //Navigator.push(
                                //  context,
                                  //MaterialPageRoute(
                                    //  builder: (_) => StoreDetailPage(
                                      //    img: exploreMenu[index]['img'])));
                            },
                            child: Container(
                              width: size.width - 30,
                              height: 160,
                              child: Image(
                                image:
                                NetworkImage(exploreMenu[index]['img']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: SvgPicture.asset(
                              exploreMenu[index]['is_liked']
                                  ? "lib/assets/images/loved_icon.svg"
                                  : "lib/assets/images/love_icon.svg",
                              width: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        exploreMenu[index]['name'],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Sponsored",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.info,
                            color: Colors.grey,
                            size: iconSizeDefault,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            exploreMenu[index]['description'],
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
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
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(3)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                exploreMenu[index]['time'],
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
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(3)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    exploreMenu[index]['rate'],
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 17,
                                  ),
                                  Text(
                                    exploreMenu[index]['rate_number'],
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
                      )
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Future<void> search(int pageKey) async{
    try {
      List<Hairdresser> newItems = [];
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

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        // _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        // _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print(error);
      // _pagingController.error = error;
    }
  }

  void _updateSearchTerm() {
    setState(() {
      cpt_tap = true;
    });
      // _pagingController.refresh();
  }
  
}


