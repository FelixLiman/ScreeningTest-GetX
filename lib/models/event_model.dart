import 'package:hive/hive.dart';
import 'package:ScreeningTest-GetX/hive_helper/hive_types.dart';
import 'package:ScreeningTest-GetX/hive_helper/hive_adapters.dart';
import 'package:ScreeningTest-GetX/hive_helper/fields/event_fields.dart';


part 'event_model.g.dart';


@HiveType(typeId: HiveTypes.event, adapterName: HiveAdapters.event)
class Event extends HiveObject{
	@HiveField(EventFields.name)
  final String name;

	@HiveField(EventFields.date)
  final String date;

  Event(this.name, this.date);
}