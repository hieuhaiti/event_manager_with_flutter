// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EventModel {
  String? id;
  DateTime startDate;

  /// The end date and time of the event.
  ///
  /// This property represents the date and time when the event is scheduled to end.
  DateTime endDate;
  bool isAllDay;
  String? subject;
  String? description;
  String? recurrenceRule;
  EventModel({
    this.id,
    required this.startDate,
    required this.endDate,
    this.isAllDay = false,
    this.subject = '',
    this.description = " ",
    required this.recurrenceRule,
  });

  EventModel copyWith({
    String? id,
    DateTime? startDate,
    DateTime? endDate,
    bool? isAllDay,
    String? subject,
    String? description,
    String? recurrenceRule,
  }) {
    return EventModel(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isAllDay: isAllDay ?? this.isAllDay,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'isAllDay': isAllDay,
      'subject': subject,
      'description': description,
      'recurrenceRule': recurrenceRule,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] != null ? map['id'] as String : null,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
      isAllDay: map['isAllDay'] as bool,
      subject: map['subject'] as String,
      description: map['description'] as String,
      recurrenceRule: map['recurrenceRule'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(id: $id, startDate: $startDate, endDate: $endDate, isAllDay: $isAllDay, subject: $subject, description: $description, recurrenceRule: $recurrenceRule)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.isAllDay == isAllDay &&
        other.subject == subject &&
        other.description == description &&
        other.recurrenceRule == recurrenceRule;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        isAllDay.hashCode ^
        subject.hashCode ^
        description.hashCode ^
        recurrenceRule.hashCode;
  }
}
