import 'package:event_manager_with_flutter/event/event_data_source.dart';
import 'package:event_manager_with_flutter/event/event_model.dart';
import 'package:event_manager_with_flutter/event/event_sevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  List<EventModel> events = [];
  final evnerSeverice = EventSevice();
  final controllerCalendar = CalendarController();

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    final events = await evnerSeverice.getEvents();
    setState(() {
      this.events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(al!.appTitle),
      ),
      body: SfCalendar(
        controller: controllerCalendar,
        dataSource: EventDataSource(events),
        view: CalendarView.day,
        monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      ),
    );
  }
}
