// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EventModel {
  String? id;
  DateTime startTime;
  DateTime endTime;
  bool isAllDay;
  String subject;
  String? description;
  String? location;
  String? recurrenceRule;
  String? color;
  EventModel({
    this.id,
    required this.startTime,
    required this.endTime,
    this.isAllDay = false,
    this.subject = '',
    this.description,
    this.location,
    this.recurrenceRule,
    this.color,
  });

  EventModel copyWith({
    String? id,
    DateTime? startTime,
    DateTime? endTime,
    bool? isAllDay,
    String? subject,
    String? description,
    String? location,
    String? recurrenceRule,
    String? color,
  }) {
    return EventModel(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isAllDay: isAllDay ?? this.isAllDay,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      location: location ?? this.location,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
      'isAllDay': isAllDay,
      'subject': subject,
      'description': description,
      'location': location,
      'recurrenceRule': recurrenceRule,
      'color': color,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] != null ? map['id'] as String : null,
      startTime: DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime'] as int),
      isAllDay: map['isAllDay'] as bool,
      subject: map['subject'] as String,
      description: map['description'] as String,
      location: map['location'] as String,
      recurrenceRule: map['recurrenceRule'] != null
          ? map['recurrenceRule'] as String
          : null,
      color: map['color'] != null ? map['color'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(id: $id, startTime: $startTime, endTime: $endTime, isAllDay: $isAllDay, subject: $subject, description: $description, location: $location, recurrenceRule: $recurrenceRule, color: $color)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.isAllDay == isAllDay &&
        other.subject == subject &&
        other.description == description &&
        other.location == location &&
        other.recurrenceRule == recurrenceRule &&
        other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        isAllDay.hashCode ^
        subject.hashCode ^
        description.hashCode ^
        location.hashCode ^
        recurrenceRule.hashCode ^
        color.hashCode;
  }
}
