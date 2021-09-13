import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/event_controller.dart';
import '../models/event_model.dart';

typedef StringValue = String Function(String);

class EventPage extends StatelessWidget {
  final EventController c = Get.put(EventController());
  final StringValue callback;
  EventPage(this.callback);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: Padding(
            padding: EdgeInsets.all(16),
            child: c.events.isEmpty
                ? Center(child: CircularProgressIndicator())
                : eventGridView(c, callback))));
  }
}

GridView eventGridView(EventController c, StringValue callback) {
  return GridView.builder(
    itemCount: c.events.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: 1,
    ),
    itemBuilder: (context, index) => GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              color: Colors.blue,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(c.events[index].name),
              Text(c.events[index].date),
            ],
          )
        ],
      ),
      onTap: () {
        callback(c.events[index].name);
        Get.back();
      },
    ),
  );
}
