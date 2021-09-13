import 'package:get/get.dart' hide Response;
import 'package:hive/hive.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/guest_model.dart';

class GuestController extends GetxController {
  var guests = [].obs;

  Future getGuests() async {
    Box box;
    try {
      box = Hive.box('screeningTest');
    } catch (error) {
      box = await Hive.openBox('screeningTest');
      print(error);
    }

    var gsts = box.get('guests');
    if (gsts == null) {
      Response response;
      var dio = Dio();
      response =
          await dio.get('http://www.mocky.io/v2/596dec7f0f000023032b8017');
      gsts = (response.data as List).map((e) => Guest.fromJson(e)).toList();
    }
    for (Guest guest in gsts) {
      guests.add(guest);
    }
  }

  onInit() {
    try {
      Hive.registerAdapter(GuestAdapter());
    } catch (e) {
      print(e);
    }
    getGuests();
    super.onInit();
  }
}
