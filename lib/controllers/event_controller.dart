import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/event_model.dart';

class EventController extends GetxController {
  var events = [].obs;

  Future getEvents() async {
    // Box box;
    // try {
    //   box = Hive.box('screeningTest');
    // } catch (error) {
    //   box = await Hive.openBox('screeningTest');
    //   print(error);
    // }
    final box = await Hive.openBox<Event>('events');
    box.values.forEach((Event event) {
      events.add(event);
    });
  }

  addEvent(Event event) async {
    events.add(event);
    final box = await Hive.openBox<Event>('events');
    box.put(event.name, event);
    print("To Do Object added $event");
  }

  onInit() {
    getEvents();
    addEvent(Event('Event A', ' 1 August 2021'));
    addEvent(Event('Event B', ' 2 August 2021'));
    addEvent(Event('Event C', ' 3 August 2021'));
    addEvent(Event('Event D', ' 4 August 2021'));
    addEvent(Event('Event E', ' 5 August 2021'));
    super.onInit();
  }
}
