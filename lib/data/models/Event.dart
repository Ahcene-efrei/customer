import 'package:customer/data/models/customer.dart';
import 'package:customer/data/models/hairdresser.dart';
import 'package:customer/data/models/product.dart';

class Event {
  String? id;
  String description;
  Product? product;
  DateTime startDateTime;
  DateTime endDateTime;

  Event(
  {
    required this.description,
    required this.startDateTime,
    required this.endDateTime,
  });

  @override
  String toString() => "Du " + this.startDateTime.toString() + " au  " + this.endDateTime.toString() + "\n"+ this.description;

}