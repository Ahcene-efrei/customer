import 'package:customer/data/models/product_type.dart';

class Product{
  int? id;
  double? price;
  ProductType? type;
  String? hairType;
  int? durationInMinutes;
  bool? realizableAtHome;

  Product({
    this.id,
    this.price,
    this.type,
    this.hairType,
    this.durationInMinutes,
    this.realizableAtHome
  });



}