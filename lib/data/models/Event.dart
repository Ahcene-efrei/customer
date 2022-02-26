import 'package:customer/data/models/hairdresser.dart';

class Event {
  final String title;
  final datetime;
  final bool free = false;
  final Hairdresser ?hairdresser;

  const Event(
    this.hairdresser,
    this.title,
    this.datetime);

  @override
  String toString() => title;

}