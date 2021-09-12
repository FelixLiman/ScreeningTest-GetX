part of '../pages/main.dart';

class EventController extends GetxController {
  var _events = [
    Event("Gathering Event", "15 Sept 2021"),
    Event("Gala Dinner Event", "16 Sept 2021"),
    Event("Seminar Event", "18 Sept 2021"),
    Event("Collaboration Event", "19 Sept 2021"),
    Event("Webinar Event", "21 Sept 2021")
  ].obs;

  setEvents(List<Event> guests) {
    _events.value = guests;
  }

  List<Event> getEvents() {
    return _events.value;
  }

  Event getEvent(int id) {
    return _events.value[id];
  }
}
