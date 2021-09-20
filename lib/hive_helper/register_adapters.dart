import 'package:hive/hive.dart';
import 'package:ScreeningTest-GetX/models/event_model.dart';
import 'package:ScreeningTest-GetX/models/guest_model.dart';

void registerAdapters() {
	Hive.registerAdapter(EventAdapter());
	Hive.registerAdapter(GuestAdapter());
}
