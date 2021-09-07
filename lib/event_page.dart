part of 'main.dart';

class Event {
  String name;
  String birthdate;
  Event(this.name, this.birthdate);
}

class EventPage extends StatefulWidget {
  _EventPageState createState() => _EventPageState();
  StringValue callback;
  EventPage(this.callback);
}

class _EventPageState extends State<EventPage> {
  List events = [Event("foo", "123"), Event("bar", "123")];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: events.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 1,
          ),
          itemBuilder: (context, index) => GestureDetector(
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text(events[index].name),
              ),
            ),
            onTap: () {
              widget.callback(events[index].name);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
