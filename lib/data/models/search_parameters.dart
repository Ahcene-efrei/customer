class SearchParameters{
  String? name;
  int? latitude;
  int? longitude;
  String? fromDateTime;
  int? minPrice;
  int? maxPrice;
  int? gender;
  int? hairType;
  int? productType;
  bool? realizableAtHome;
  int? pageNumber;
  int? pageSize;

  SearchParameters({
    this.name,
    this.longitude,
    this.latitude,
    this.hairType,
    this.gender,
    this.realizableAtHome,
    this.fromDateTime,
    this.maxPrice,
    this.minPrice,
    this.pageNumber,
    this.pageSize,
    this.productType
  });
}