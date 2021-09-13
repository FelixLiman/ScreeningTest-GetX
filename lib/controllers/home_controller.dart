import 'package:get/get.dart';

class HomeController extends GetxController {
  var _eventName = Rxn<String>().obs;
  var _guestName = Rxn<String>().obs;

  setEvent(String event) {
    _eventName.value.value = event;
  }

  String? getEvent() {
    return _eventName.value.value;
  }

  setGuest(String guest) {
    _guestName.value.value = guest;
  }

  String? getGuest() {
    return _guestName.value.value;
  }
}
