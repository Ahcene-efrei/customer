import 'package:customer/data/enums/genre.dart';
import 'package:customer/data/enums/hairtype.dart';
import 'package:customer/data/enums/producttype.dart';

class SearchParameters{
  String? name;
  int? latitude;
  int? longitude;
  String? fromDateTime;
  int minPrice;
  int maxPrice;
  Genre gender;
  HairType hairType;
  ProductType productType;
  bool? realizableAtHome;
  int? pageNumber;
  int? pageSize;

  SearchParameters({
    this.name,
    this.longitude,
    this.latitude,
    this.hairType = HairType.Undefined,
    this.gender = Genre.Undefined,
    this.realizableAtHome,
    this.fromDateTime,
    this.maxPrice = 500,
    this.minPrice = 0,
    this.pageNumber,
    this.pageSize,
    this.productType = ProductType.Haircut1
  });
}