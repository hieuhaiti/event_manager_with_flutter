import 'dart:ui';

import 'package:event_manager_with_flutter/event/event_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventModel> source) {
    appointments = source;

    /// This file defines the data source for event-related operations.
    ///
    /// The `event_data_source.dart` file is responsible for managing the data
    /// related to events within the application. It includes methods for
    /// fetching, updating, and deleting event data from the underlying data
    /// storage.
    ///
    DateTime getStartTime(int index) {
      EventModel item = appointments!.elementAt(index);
      return item.startTime;
    }

    DateTime getEndTime(int index) {
      EventModel item = appointments!.elementAt(index);
      return item.endTime;
    }

    // get subject
    String getSubject(int index) {
      EventModel event = appointments!.elementAt(index);
      return event.subject;
    }

    // get description
    String? getNotes(int index) {
      EventModel event = appointments!.elementAt(index);
      return event.description;
    }
    // get isAllDay

    bool isAllDay(int index) {
      EventModel event = appointments!.elementAt(index);
      return event.isAllDay;
    }

    //get recurrence rule
    String? getRecurrenceRule(int index) {
      EventModel event = appointments!.elementAt(index);
      return event.recurrenceRule;
    }

    // get color
    Color getColor(int index) {
      EventModel event = appointments!.elementAt(index);
      return event.isAllDay
          ? const Color.fromARGB(255, 3, 237, 11)
          : super.getColor(index);
    }
  }
}
