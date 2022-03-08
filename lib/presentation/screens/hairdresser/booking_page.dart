import 'package:customer/data/api/customer_api.dart';
import 'package:customer/data/api/error_exception.dart';
import 'package:customer/data/api/hairdresser_api.dart';
import 'package:customer/data/json/parameterJson.dart';
import 'package:customer/data/models/Event.dart';
import 'package:customer/data/models/EventCustomer.dart';
import 'package:customer/data/models/EventHairdresser.dart';
import 'package:customer/data/models/appointment.dart' as appointement;
import 'package:customer/data/models/day.dart';
import 'package:customer/data/models/hairdresser.dart';
import 'package:customer/data/models/product.dart';
import 'package:customer/data/models/time_slot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:customer/data/json/home_page_json.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  final Hairdresser currentHairdresser;
  const BookingPage({Key? key, required this.currentHairdresser}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  late Map<DateTime, List<appointement.Appointment>> selectedEvents;
  late ValueNotifier<List<appointement.Appointment>> _selectedEventsValueNotifier;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  late Hairdresser hairdresser = listOfHairdresser.first;
  final DateTime kToday = DateTime.now();
  late final DateTime kFirstDay;
  late final DateTime kLastDay;
  late TimeSlot? selectedTimeslot;
  TextEditingController _eventController = TextEditingController();


  // Initial Selected Value
  Product? dropdownvalue;

  // List of items in our dropdown menu
  List<Product> listProducts = products;

  get currentCustomer => customer;
  EventHairdresser eventHairdresser = ListEventHairdresser.first;

  late CustomerApi _customerApi;

  @override
  void initState() {
    selectedEvents = {};
    kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
    kLastDay = DateTime(kToday.year, kToday.month, kToday.day + 21);
    dropdownvalue = widget.currentHairdresser.catalog!.first;
    selectedTimeslot = null;
    super.initState();
  }

  List<appointement.Appointment> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  ValueListenable<List<appointement.Appointment>> _getValueNotifierEventsfromDay(DateTime date){
    return ValueNotifier(_getEventsfromDay(date));
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking calendar"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<appointement.Appointment>>(
              valueListenable: _getValueNotifierEventsfromDay(selectedDay),
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Event"),
            content: Column(
              children: [
                Text("Votre Barber propose des crénaux de "
                    + eventHairdresser.timeSlotsDurationInMinutes.toString()
                    + "min"
                ),
                TextFormField(
                  controller: _eventController,
                ),
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of listProducts
                  items: (widget.currentHairdresser.catalog)!.map((Product x) {
                    // var var ListProductType.firstWhere((element) => element['value'] == x.type)['text'].toString();;
                    // print(ListProductType.firstWhere((element) => element['value'] == x.type)['text'].toString());
                    return DropdownMenuItem(
                      value: x,
                      child: Text(ListProductType.firstWhere((element) => element['value'] == x.type)['text'].toString()),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (Product? newValue) {
                    setState(() {
                      print(newValue!.type);
                      dropdownvalue = newValue;
                    });
                  },
                ),
                Text('Voici les créneaux :'),
                getTimeSlots(context)
              ],
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () async {
                  var res;
                  appointement.Appointment appt;
                  TimeSlot timeSlot = TimeSlot(
                      id: "edporjgnj",
                      start: selectedDay.toString(),
                      end: selectedDay.toString()
                  );
                  appt = appointement.Appointment(timeSlot: timeSlot, product: dropdownvalue, atHome: false);

                  
                  if (selectedEvents[selectedDay] != null) {
                    selectedEvents[selectedDay]?.add(appt);
                    try{
                      res = await _customerApi.addAppointment(appt);
                    }on ErrorException catch (_) {
                      print("code error");
                    }
                    
                  }
                  print(res);
                  print(selectedEvents[selectedDay]);
                  Navigator.pop(context);
                  _eventController.clear();
                  setState((){});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Book"),
        icon: Icon(Icons.add),
      ),
    );
  }

  Column getTimeSlots(context){
    var date = new DateFormat('dd-MM-yyyy').format(selectedDay);
    Day planning = widget.currentHairdresser.planning!.firstWhere((element) => new DateFormat('dd-MM-yyyy').format(DateTime.parse(element.start)) == date);
    if(planning == null){
      print("nulllllll -------------------------------------");
    }
    var timeslots = planning.timeSlots;
    print(timeslots);
    List<Widget> list = [];
    List<Row> listOfRows = [];
    for(var i = 0; i < timeslots!.length; i++){
      if(i > 0 && i%3 == 0){
        // print(i);
        // [...listOfRows, new Row(children: list)];
        listOfRows.add(new Row(children: list));
        list = [];
      }
      var start = DateTime.parse(timeslots[i].start);
      var end = DateTime.parse(timeslots[i].end);
      list.add(getCard("${start.hour}:${start.minute} - ${end.hour}:${end.minute}", timeslots[i], context));

    }
    listOfRows.add(new Row(children: list));
    return new Column(children: listOfRows);

  }

  Widget getCard(text, value, context){
    return new Expanded(
        child: InkWell(
          onTap: ()=>{
            // widget.setProductType(value),
            // Navigator.pop(context)
            // Navigator.push(context, MaterialPageRoute(builder: (ctx){
            //   return FilterHairTypeScreen(currentHairType: widget.params.hairType,);
            // }),)

            setState(() {
              // print("setState");
              selectedTimeslot = value;
            }),
            // print(value.id),
            // print(selectedTimeslot!.id)
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            color: selectedTimeslot != null && value.id == selectedTimeslot!.id ? Colors.blueAccent : Colors.white,
            child: Center(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        )
    );
  }
}




