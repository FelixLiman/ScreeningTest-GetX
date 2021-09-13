import 'package:get/get.dart' hide Response;
import 'package:flutter/material.dart';
import '../controllers/guest_controller.dart';

typedef StringValue = String Function(String);

class GuestPage extends StatelessWidget {
  final GuestController c = Get.put(GuestController());
  final StringValue callback;
  GuestPage(this.callback);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: Padding(
            padding: EdgeInsets.all(16),
            child: c.guests.isEmpty
                ? Center(child: CircularProgressIndicator())
                : guestGridView(c, callback))));
  }
}

GridView guestGridView(GuestController c, StringValue callback) {
  return GridView.builder(
    itemCount: c.guests.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: 2,
    ),
    itemBuilder: (context, index) => GestureDetector(
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text(c.guests[index].name),
        ),
      ),
      onTap: () {
        callback(c.guests[index].name);
        Get.back();
      },
    ),
  );
}
