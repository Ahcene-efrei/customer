import 'package:customer/data/models/time_slot.dart';

class Day{
  String? id;
  String start;
  String end;
  List<TimeSlot>? timeSlots;

  Day({
    this.id,
    this.start = '',
    this.end = '',
    this.timeSlots
  });

  Day fromJson(jsonData){
    id = jsonData['id'];
    start = jsonData['start'];
    end = jsonData['end'];
    timeSlots = (jsonData["timeSlots"] as List).map((x) => TimeSlot().fromJson(x)).toList();
    return this;
  }
}