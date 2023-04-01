import '../../../app/constants.dart';
import 'package:retrofit/http.dart';
import '../../response/responses.dart';
import 'package:dio/dio.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Constants.logIn)
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST(Constants.forgotPassword)
  Future<ForgotPasswordResponse> forgotPassword(
    @Field("email") String email,
  );

  @POST("/customer/register")
  Future<AuthenticationResponse> register(
    @Field("user_name") String userName,
    @Field("country_mobile_code") String countryMobileCode,
    @Field("mobile_number") String mobileNumber,
    @Field("email") String email,
    @Field("password") String password,
    @Field("profile_picture") String profilePicture,
  );
}
