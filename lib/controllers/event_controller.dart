import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/event_model.dart';

class EventController extends GetxController {
  var events = [].obs;

  Future getEvents() async {
    Box box;
    try {
      box = Hive.box('screeningTest');
    } catch (error) {
      box = await Hive.openBox('screeningTest');
      print(error);
    }

    var evnts = box.get('events');
    if (evnts != null) {
      for (Event event in evnts) {
        events.add(event);
      }
    }
  }

  addEvent(Event event) async {
    events.add(event);
    var box = await Hive.openBox('screeningTest');
    box.put('events', events.toList());
    print("To Do Object added $events");
  }

  onInit() {
    try {
      Hive.registerAdapter(EventAdapter());
    } catch (e) {
      print(e);
    }
    getEvents();
    addEvent(Event('Event A', ' 1 August 2021'));
    addEvent(Event('Event B', ' 2 August 2021'));
    addEvent(Event('Event C', ' 3 August 2021'));
    addEvent(Event('Event D', ' 4 August 2021'));
    addEvent(Event('Event E', ' 5 August 2021'));
    super.onInit();
  }
}
