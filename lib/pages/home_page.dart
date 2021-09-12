part of 'main.dart';

class HomePage extends StatelessWidget {
  final HomeController c = Get.put(HomeController());
  final String name;
  HomePage(this.name);

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
                children: [Text('Nama:'), Text(name)],
              ),
              SizedBox(height: 16),
              TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      primary: Colors.white,
                      backgroundColor: Colors.purple),
                  onPressed: () {
                    Get.to(EventPage((event) {
                      c.setEvent(event);
                      return "";
                    }));
                  },
                  child: Center(
                    child: Obx(() => Text(
                        c.getEvent() != null ? c.getEvent()! : 'Pilih Event')),
                  )),
              TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      primary: Colors.white,
                      backgroundColor: Colors.purple),
                  onPressed: () {
                    Get.to(GuestPage((guest) {
                      c.setGuest(guest);
                      return "";
                    }));
                  },
                  child: Center(
                    child: Obx(() => Text(
                        c.getGuest() != null ? c.getGuest()! : 'Pilih Guest')),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
