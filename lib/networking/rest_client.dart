import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/guest_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://www.mocky.io/v2")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/596dec7f0f000023032b8017")
  Future<List<Guest>> getGuests();
}
