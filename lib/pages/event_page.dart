part of 'main.dart';

class EventPage extends StatelessWidget {
  final EventController c = Get.put(EventController());
  final StringValue callback;
  EventPage(this.callback);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16),
      child: FutureBuilder(
          future: Hive.openBox('events'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return eventGridView(c, callback);
              }
            } else {
              return CircularProgressIndicator();
            }
          }),
    ));
  }
}

GridView eventGridView(EventController c, StringValue callback) {
  return GridView.builder(
    itemCount: c.getEvents().length,
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
              Text(c.getEvent(index).name),
              Text(c.getEvent(index).date),
            ],
          )
        ],
      ),
      onTap: () {
        callback(c.getEvent(index).name);
        Get.back();
      },
    ),
  );
}
