
import 'package:customer/data/models/Event.dart';

import 'hairdresser.dart';

class EventHairdresser extends Event {
  String? id;
  String description;
  Hairdresser? hairdresser;
  DateTime startDateTime;
  DateTime endDateTime;
  int workingDayDurationInMinutes;
  int timeSlotsDurationInMinutes;
  bool availability = true;
  bool? canMoveAtCustomersHome = false;
  List<DateTime> dates = [];

  EventHairdresser({
    this.hairdresser,
    required this.description,
    required this.startDateTime,
    required this.endDateTime,
    required this.availability,
    this.canMoveAtCustomersHome,
    required this.timeSlotsDurationInMinutes,
    required this.workingDayDurationInMinutes
  }) : super(
    description: description,
    endDateTime: endDateTime,
    startDateTime: startDateTime
  );

}