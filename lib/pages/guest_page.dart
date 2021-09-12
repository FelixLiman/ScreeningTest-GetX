part of 'main.dart';

Future<List<Guest>> fetchAlbum() async {
  try {
    Response response;
    var dio = Dio();
    response = await dio.get('http://www.mocky.io/v2/596dec7f0f000023032b8017');
    return (response.data as List).map((e) => Guest.fromJson(e)).toList();
  } catch (error, stacktrace) {
    throw Exception("Exception occured: $error stackTrace: $stacktrace");
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
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return guestGridView(snapshot, widget.callback);
                }
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

GridView guestGridView(AsyncSnapshot snapshot, StringValue callback) {
  return GridView.builder(
    itemCount: snapshot.data!.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: 2,
    ),
    itemBuilder: (context, index) => GestureDetector(
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text(snapshot.data![index].name),
        ),
      ),
      onTap: () {
        callback(snapshot.data![index].name);
        Get.back();
      },
    ),
  );
}
