import 'dart:convert';
import 'package:get/get.dart' hide Response;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';
part 'login_page.dart';
part 'home_page.dart';
part 'guest_page.dart';
part 'event_page.dart';
part '../models/guest_model.dart';
part '../models/event_model.dart';
part '../controllers/event_controller.dart';
part '../controllers/guest_controller.dart';
part '../controllers/home_controller.dart';

typedef StringValue = String Function(String);

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final textFieldController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
    );
  }
}
