class Planning{ // POUR L'APP HAIRDRESSER
  String? startTime;
  int? workingDayDurationInMinutes;
  int? timeSlotsDurationInMinutes;
  bool? availability;
  bool? canMoveAtClientsHome;
  List<String>? dates;

  Planning({
    this.canMoveAtClientsHome,
    this.availability,
    this.dates,
    this.startTime,
    this.timeSlotsDurationInMinutes,
    this.workingDayDurationInMinutes
  });
}