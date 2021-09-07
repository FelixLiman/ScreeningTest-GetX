import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
part 'login_page.dart';
part 'home_page.dart';
part 'guest_page.dart';
part 'event_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Material Basics',
    home: LoginPage(),
  ));
}