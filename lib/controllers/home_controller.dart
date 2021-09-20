import 'package:get/get.dart';

class HomeController extends GetxController {
  var _eventName = Rxn<String>();
  var _guestName = Rxn<String>();

  setEvent(String event) {
    _eventName.value = event;
  }

  String? getEvent() {
    return _eventName.value;
  }

  setGuest(String guest) {
    _guestName.value = guest;
  }

  String? getGuest() {
    return _guestName.value;
  }
}
