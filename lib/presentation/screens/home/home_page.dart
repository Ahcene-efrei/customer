import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:customer/components/slider/CustomSlider.dart';
import 'package:customer/data/json/home_page_json.dart';
import 'package:customer/styles/theme.dart';
import 'package:customer/presentation/screens/home/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTypeOfLocation = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            CustomSliderWidget(
              items: [
                "lib/assets/images/slider2.png",
                "lib/assets/images/slider1.png",
                "lib/assets/images/slider3.png"
              ],
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
                color: Colors.black12,
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "lib/assets/images/pin_icon.svg",
                          width: 20,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child:Text("Ma position", style: customContent,)
                        )
                      ],
                    ),
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
                    color: Colors.black,
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
                            color: Colors.white),
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
                      style: customContent,
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
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                    children: List.generate(categories.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              categories[index]['img'],
                              width: 40,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              categories[index]['name'],
                              style: customParagraph,
                            )
                          ],
                        ),
                      );
                    })),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Container getADomicile(size){
    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Les meilleurs coiffeurs à proximité",
              style: customTitle,
            ),
            SizedBox(
              height: 15,
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
                  size: 15,
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
                            size: 15,
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
  
}


