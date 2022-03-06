// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:customer/data/models/Event.dart';
import 'package:customer/data/models/hairdresser.dart';
import 'package:table_calendar/table_calendar.dart';

/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event(new Hairdresser(),
        'Event $item | ${index + 1} username',
        DateTime.utc(kFirstDay.year, kFirstDay.month, )
    )))
  ..addAll({
    kToday: [
      Event(new Hairdresser(),
          'Today\'s Event 1 username',
          DateTime.utc(kFirstDay.year, kFirstDay.month, 10, 30)),
      Event(new Hairdresser(),
          'Today\'s Event 2 username',
          DateTime.utc(kFirstDay.year, kFirstDay.month, 12, 30)),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month, kToday.day + 21);