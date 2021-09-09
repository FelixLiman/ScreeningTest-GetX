part of 'main.dart';

class Event {
  String name;
  String date;
  Event(this.name, this.date);
}

class EventPage extends StatefulWidget {
  _EventPageState createState() => _EventPageState();
  StringValue callback;
  EventPage(this.callback);
}

class _EventPageState extends State<EventPage> {
  List events = [
    Event("Gathering Event", "15 Sept 2021"),
    Event("Gala Dinner Event", "16 Sept 2021"),
    Event("Seminar Event", "18 Sept 2021"),
    Event("Collaboration Event", "19 Sept 2021"),
    Event("Webinar Event", "21 Sept 2021")
  ];

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image(
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    color: Colors.blue,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(events[index].name),
                    Text(events[index].date),
                  ],
                )
              ],
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
