class TimeSlot{
  String? id;
  String? start;
  String? end;
  int? durationInMinutes;
  bool? available;
  bool? canMoveAtClientsHome;

  TimeSlot({
    this.id,
    this.start,
    this.end,
    this.durationInMinutes,
    this.available,
    this.canMoveAtClientsHome
  });


}