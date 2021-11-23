import 'package:customer/data/models/time_slot.dart';

class Day{
  String? id;
  String? start;
  String? end;
  List<TimeSlot>? timeSlots;

  Day({
    this.id,
    this.start,
    this.end,
    this.timeSlots
  });
}