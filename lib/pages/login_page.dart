import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final textFieldController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term'),
                cursorColor: Colors.purple,
                controller: textFieldController,
              ),
              SizedBox(height: 16),
              TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    primary: Colors.white,
                    backgroundColor: Colors.purple),
                onPressed: () {
                  Get.to(HomePage(textFieldController.text));
                },
                child: Center(child: Text('Lanjut')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
