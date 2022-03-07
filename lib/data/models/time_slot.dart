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

  TimeSlot fromJson(jsonData){
    id = jsonData['id'];
    start = jsonData['start'];
    end = jsonData['end'];
    durationInMinutes = jsonData['durationInMinutes'];
    available = jsonData['available'];
    canMoveAtClientsHome = jsonData['canMoveAtClientsHome'];
    return this;
  }

  @override
  String toString() => "Du " + this.start! + " au  " + this.end!;


}