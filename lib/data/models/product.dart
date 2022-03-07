import 'package:customer/data/enums/hairtype.dart';
import 'package:customer/data/enums/producttype.dart';
import 'package:customer/data/json/parameterJson.dart';

class Product{
  String? id;
  double? price;
  ProductType? type;
  HairType? hairType;
  int? durationInMinutes;
  bool? realizableAtHome;
  String? name;

  Product({
    this.id,
    this.price,
    this.type,
    this.hairType,
    this.durationInMinutes,
    this.realizableAtHome,
    this.name
  });

  getName(){
    return this.name;
  }

  Product fromJson(jsonData){
    id = jsonData["id"];
    price = jsonData["price"];
    type = getProductType(jsonData["type"]);
    hairType = getHairType(jsonData["hairType"]);
    durationInMinutes = jsonData["durationInMinutes"];
    realizableAtHome = jsonData["realizableAtHome"];
    name = jsonData["name"];

    return this;
  }

  HairType getHairType(type){
    for(var i = 0; i < ListHairType.length; i++){
      HairType current = ListHairType[i]['value'] as HairType;
      if(current.index == type.toInt()){
        return current;
      }
    }
    return HairType.Undefined;
  }

  ProductType getProductType(type){
    for(var i = 0; i < ListHairType.length; i++){
      ProductType current = ListProductType[i]['value'] as ProductType;
      if(current.index == type.toInt()){
        return current;
      }
    }
    return ProductType.Haircut1;
  }

}