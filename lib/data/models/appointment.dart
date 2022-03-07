import 'package:customer/data/models/product.dart';
import 'package:customer/data/models/time_slot.dart';

class Appointment{
  String? id;
  TimeSlot? timeSlot;
  Product? product;
  bool? atHome;
  String? status;

  Appointment({
    this.id,
    this.product,
    this.atHome,
    this.timeSlot,
    this.status
  });

  Appointment fromJson(jsonData){
    id = jsonData["id"];
    product = Product().fromJson(jsonData["product"]);
    atHome = jsonData["atHome"];
    timeSlot = TimeSlot().fromJson(jsonData["timeSlot"]);
    status = jsonData["status"];

    return this;
  }

  @override
  String toString() => this.timeSlot.toString();
}