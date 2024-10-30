import 'package:event_manager_with_flutter/event/event_model.dart';
import 'package:event_manager_with_flutter/event/event_sevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventDetailView extends StatefulWidget {
  final EventModel event;
  const EventDetailView({super.key, required this.event});

  @override
  State<EventDetailView> createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();
  final recurrenceRuleController = TextEditingController();
  final eventSevice = EventSevice();
  @override
  void initState() {
    super.initState();
    subjectController.text = widget.event.subject;
    descriptionController.text = widget.event.description ?? '';
    recurrenceRuleController.text = widget.event.recurrenceRule!;
  }

  Future<void> pickDateTime({required bool isStart}) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: isStart ? widget.event.startDate : widget.event.endDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );

    if (pickedDate == null) return;
    if (!mounted) return;
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
          isStart ? widget.event.startDate : widget.event.endDate),
    );

    if (pickedTime == null) return;
    if (!mounted) return;
    setState(() {
      if (!isStart) return;
      widget.event.startDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      if (widget.event.startDate.isAfter(widget.event.endDate)) {
        widget.event.endDate =
            widget.event.startDate.add(const Duration(hours: 1));
      }
    });
  }

  Future<void> saveEvent() async {
    widget.event.subject = subjectController.text;
    widget.event.description = descriptionController.text;
    widget.event.recurrenceRule = recurrenceRuleController.text;
    await eventSevice.saveEvent(widget.event);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> deleteEvent() async {
    await eventSevice.deleteEvent(widget.event.id!);
    if (!mounted) return;
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.id == null ? al.addEvent : al.detailEvent),
      ),
    );
  }
}
