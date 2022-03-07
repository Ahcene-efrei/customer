import 'package:customer/data/enums/genre.dart';
import 'package:customer/data/enums/hairtype.dart';
import 'package:customer/data/enums/producttype.dart';

class SearchParameters{
  String? name;
  double latitude;
  double longitude;
  String? fromDateTime;
  double minPrice;
  double maxPrice;
  Genre gender;
  HairType hairType;
  ProductType productType;
  bool realizableAtHome;
  int pageNumber;
  int pageSize;

  SearchParameters({
    this.name,
    this.longitude = 0.0,
    this.latitude = 0.0,
    this.hairType = HairType.Undefined,
    this.gender = Genre.Undefined,
    this.realizableAtHome = true,
    this.fromDateTime,
    this.maxPrice = 500,
    this.minPrice = 1,
    this.pageNumber = 1,
    this.pageSize = 10,
    this.productType = ProductType.Haircut1
  });
}