class Addresse{

  String? id;
  String? name;
  String? address1;
  String? address2;
  String? city;
  String? country;
  String? zipCode;
  int? latitude;
  int? longitude;

  Addresse({
    this.id,
    this.name,
    this.address1,
    this.address2,
    this.city,
    this.country,
    this.zipCode,
    this.latitude,
    this.longitude
  });

  Addresse fromJson(jsonData){
    print('addresse fromJson');
    id = jsonData["id"];
    name = jsonData["name"];
    address1 = jsonData["address1"];
    address2 = jsonData["address2"];
    city = jsonData["city"];
    country = jsonData["country"];
    zipCode = jsonData["zipCode"];
    latitude = jsonData["latitude"];
    longitude = jsonData["longitude"];

    return this;
  }


}