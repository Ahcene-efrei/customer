import 'package:customer/data/models/Event.dart';
import 'package:customer/data/models/EventCustomer.dart';
import 'package:customer/data/models/EventHairdresser.dart';
import 'package:customer/data/models/hairdresser.dart';
import 'package:customer/data/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:customer/data/json/home_page_json.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';



class FavoritePage extends StatefulWidget {
  FavoritePage({Key? key}) : super(key: key);
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late Map<DateTime, List<EventCustomer>> selectedEvents;
  late ValueNotifier<List<EventCustomer>> _selectedEventsValueNotifier;
  CalendarFormat format = CalendarFormat.week;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  late Hairdresser hairdresser = listOfHairdresser.first;
  final DateTime kToday = DateTime.now();
  late final DateTime kFirstDay;
  late final DateTime kLastDay;

  TextEditingController _eventController = TextEditingController();


  // Initial Selected Value
  Product? dropdownvalue;

  // List of items in our dropdown menu
  List<Product> listProducts = products;

  get currentCustomer => customer;
  EventHairdresser eventHairdresser = ListEventHairdresser.first;

  @override
  void initState() {
    selectedEvents = {};
    kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
    kLastDay = DateTime(kToday.year, kToday.month, kToday.day + 21);
    dropdownvalue = listProducts.first;
    super.initState();
  }

  List<EventCustomer> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  ValueListenable<List<EventCustomer>> _getValueNotifierEventsfromDay(DateTime date){
    return ValueNotifier(_getEventsfromDay(selectedDay));
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
        title: Text("ESTech Calendar"),
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
            child: ValueListenableBuilder<List<EventCustomer>>(
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
                  items: listProducts.map((Product product) {
                    return DropdownMenuItem(
                      value: product,
                      child: Text(product.getName()),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (Product? newValue) {
                    setState(() {
                      print(newValue?.getName());
                      dropdownvalue = newValue;
                    });
                  },
                ),

              ],
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {

                  } else {

                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]?.add(
                        EventCustomer(
                            product: dropdownvalue,
                            hairdresser: hairdresser,
                            description:_eventController.text,
                            endDateTime: DateTime(
                              eventHairdresser.startDateTime.year,
                              eventHairdresser.startDateTime.month,
                              eventHairdresser.startDateTime.day,
                              eventHairdresser.startDateTime.hour,
                              eventHairdresser.startDateTime.minute + eventHairdresser.timeSlotsDurationInMinutes
                              ),
                            startDateTime: selectedDay,
                            customer: currentCustomer,
                        ),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        EventCustomer(
                          product: dropdownvalue,
                          hairdresser: hairdresser,
                          description:_eventController.text,
                          endDateTime: DateTime(
                              eventHairdresser.startDateTime.year,
                              eventHairdresser.startDateTime.month,
                              eventHairdresser.startDateTime.day,
                              eventHairdresser.startDateTime.hour,
                              eventHairdresser.startDateTime.minute + eventHairdresser.timeSlotsDurationInMinutes
                          ),
                          startDateTime: selectedDay,
                          customer: currentCustomer,
                        ),
                      ];
                    }
                    print(selectedEvents[selectedDay]);
                  }
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
}