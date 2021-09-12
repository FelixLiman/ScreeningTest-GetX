part of '../pages/main.dart';

@HiveType(typeId: 0)
class Event {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String date;

  Event(this.name, this.date);
}
