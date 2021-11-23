import 'package:customer/data/models/address.dart';
import 'package:customer/data/models/appointment.dart';

class Customer{
  String? id;
  String? phoneNumber;
  String? firstname;
  String? lastname;
  String? email;
  String? pictureUrl;
  int? appointmentCount;
  List<Appointment>? appointments;
  int? hairType;
  int? status;
  int? gender;
  List<Addresse>? addresses;

  Customer({
    this.id,
    this.phoneNumber,
    this.hairType,
    this.email,
    this.lastname,
    this.firstname,
    this.addresses,
    this.appointmentCount,
    this.appointments,
    this.gender,
    this.pictureUrl,
    this.status
  });
}