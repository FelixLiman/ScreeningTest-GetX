part of '../pages/main.dart';

class Guest {
  final int id;
  final String name;
  final String birthdate;

  Guest({required this.id, required this.name, required this.birthdate});

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['id'],
      name: json['name'],
      birthdate: json['birthdate'],
    );
  }
}

// @HiveType()
// class Guest {
//   @HiveField(0)
//   final int id;

//   @HiveField(1)
//   final String name;

//   @HiveField(2)
//   final String birthdate;

//   Guest({required this.id, required this.name, required this.birthdate});
// }
