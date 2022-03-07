import 'package:customer/data/models/product.dart';
import 'package:customer/data/models/address.dart';
import 'package:customer/data/models/appointment.dart';
import 'package:customer/data/models/day.dart';

class Hairdresser {
  int? id;
  String? phoneNumber;
  String? firstname;
  String? lastname;
  String? email;
  String? pictureUrl;
  int? appointmentsCount;
  int? status;
  int? gender;
  Addresse? address;
  List<Appointment>? appointments;
  List<Day>? planning;
  List<Product>? catalog;
  String? siretNumber;
  String? productId;

  Hairdresser({
    this.id,
    this.phoneNumber,
    this.firstname,
    this.lastname,
    this.email,
    this.pictureUrl,
    this.appointmentsCount,
    this.status,
    this.gender,
    this.address,
    this.appointments,
    this.planning,
    this.catalog,
    this.siretNumber,
    this.productId
  });

  Hairdresser fromJson(jsonData){
    phoneNumber = jsonData["phoneNumber"];
    firstname = jsonData["firstname"];
    lastname = jsonData["lastname"];
    email = jsonData["email"];
    pictureUrl = jsonData["pictureUrl"];
    gender = jsonData["gender"];
    address = Addresse().fromJson(jsonData["address"]);
    catalog = (jsonData["catalog"] as List).map((x) => Product().fromJson(x)).toList();
    planning = (jsonData["planning"] as List).map((x) => Day().fromJson(x)).toList().cast<Day>();
    appointments = (jsonData["appointments"] as List).map((x) => Appointment().fromJson(x)).toList();
    return this;
  }

  getFirstName(){
    return this.firstname;
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'pictureUrl': pictureUrl,
      'gender': gender,
      'address': address,
    };
  }

  bool isRegistered(){
    return (phoneNumber != ''
            && firstname != ''
            && lastname != ''
            && email != ''
    );
  }


}