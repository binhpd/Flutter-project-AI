import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/register/register_request.dart';
import '../../models/register/register_response.dart';

part 'register_api.g.dart';

@RestApi()
abstract class RegisterApi {
  factory RegisterApi(Dio dio) = _RegisterApi;

  @POST('/users/add')
  Future<RegisterResponse> register(@Body() RegisterRequest request);
} 