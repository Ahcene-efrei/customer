
import 'package:customer/data/models/Event.dart';
import 'package:customer/data/models/product.dart';

import 'customer.dart';
import 'hairdresser.dart';

class EventCustomer extends Event{
  String? id;
  String description;
  Hairdresser? hairdresser;
  Product? product;
  DateTime startDateTime;
  DateTime endDateTime;
  List<DateTime> dates = [];
  Customer? customer;

  EventCustomer({
    this.hairdresser,
    required this.description,
    required this.startDateTime,
    required this.endDateTime,
    this.customer,
    this.product
  }) : super(
      description: description,
      endDateTime: endDateTime,
      startDateTime: startDateTime
  );

  @override
  String toString() => product?.getName() + "\n" + super.toString();

}