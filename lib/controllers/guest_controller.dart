import 'package:get/get.dart' hide Response;
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:screening_flutter/networking/rest_client.dart';
import '../models/guest_model.dart';

class GuestController extends GetxController {
  var guests = [].obs;

  Future getGuests() async {
    // Box box;
    // try {
    //   box = Hive.box('screeningTest');
    // } catch (error) {
    //   box = await Hive.openBox('screeningTest');
    //   print(error);
    // }

    final box = await Hive.openBox<Guest>('guests');
    box.values.forEach((Guest guest) {
      guests.add(guest);
    });

    if (box.values.isEmpty) {
      final client = RestClient(Dio());
      final gsts = await client.getGuests();
      gsts.forEach((Guest guest) {
        guests.add(guest);
        box.put(guest.id, guest);
      });
    }

    // var gsts = box.get('guests');
    // if (gsts == null) {
    //   final client = RestClient(Dio());
    //   guests = client.getGuests();
    // }
    // for (Guest guest in gsts) {
    //   guests.add(guest);
    // }
  }

  onInit() {
    getGuests();
    super.onInit();
  }
}
