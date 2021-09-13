import 'package:hive/hive.dart';
part 'event_model.g.dart';

@HiveType(typeId: 0)
class Event {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String date;

  Event(this.name, this.date);
}
