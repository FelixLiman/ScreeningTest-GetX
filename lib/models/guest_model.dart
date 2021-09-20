import 'package:hive/hive.dart';
import 'package:ScreeningTest-GetX/hive_helper/hive_types.dart';
import 'package:ScreeningTest-GetX/hive_helper/hive_adapters.dart';
import 'package:ScreeningTest-GetX/hive_helper/fields/guest_fields.dart';


part 'guest_model.g.dart';


@HiveType(typeId: HiveTypes.guest, adapterName: HiveAdapters.guest)
class Guest extends HiveObject{
	@HiveField(GuestFields.id)
  final int id;

	@HiveField(GuestFields.name)
  final String name;

	@HiveField(GuestFields.birthdate)
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