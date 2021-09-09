part of 'main.dart';

typedef StringValue = String Function(String);

class Guest {
  final int id;
  final String name;
  final String birthdate;

  Guest({
    required this.id,
    required this.name,
    required this.birthdate
  });

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['id'],
      name: json['name'],
      birthdate: json['birthdate'],
    );
  }
}

Future<List<Guest>> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://www.mocky.io/v2/596dec7f0f000023032b8017'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> values = <dynamic>[];
    List<Guest> guests = <Guest>[];
    debugPrint(response.body);
    values = json.decode(response.body);
    if(values.length>0) {
      for(int i=0; i<values.length; i++) {
        if(values[i] != null) {
          Map<String,dynamic> map = values[i];
          guests.add(Guest.fromJson(map));
          debugPrint('Id-------${map['id']}');
        }
      }
    }
    debugPrint(guests.toString());
    return guests;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class GuestPage extends StatefulWidget {
  _GuestPageState createState() => _GuestPageState();
  StringValue callback;
  GuestPage(this.callback);
}

class _GuestPageState extends State<GuestPage> {
  late Future<List<Guest>> futureGuests;

  @override
  void initState() {
    super.initState();
    futureGuests = fetchAlbum();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<List<Guest>>(
            future: futureGuests,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                throw snapshot.error!;
              }
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        child: Container(
                          color: Colors.blue,
                          child: Center(
                            child: Text(snapshot.data![index].name),
                          ),
                        ),
                        onTap: () {
                          widget.callback(snapshot.data![index].name);
                          Navigator.pop(context);
                        },
                      ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
        ),
      ),
    );
  }
}