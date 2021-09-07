part of 'main.dart';

class HomePage extends StatefulWidget {
  final String name;
  HomePage(this.name);
  _HomePageState createState() => _HomePageState(name);
}

class _HomePageState extends State<HomePage> {
  String? eventName;
  String? guestName;
  String name;
  _HomePageState(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nama:'),
                  Text(name)
                ],
              ),
              SizedBox(height: 16),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    primary: Colors.white,
                    backgroundColor: Colors.purple
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (_) => EventPage((event) {
                        return eventName = event;
                      })
                  ));
                },
                child: Center(
                    child: Text(eventName != null ? eventName! : 'Pilih Event')
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    primary: Colors.white,
                    backgroundColor: Colors.purple
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (_) => GuestPage((guest) {
                        return guestName = guest;
                      })
                  ));
                },
                child: Center(
                    child: Text(guestName != null ? guestName! : 'Pilih Guest')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}