import 'package:dio/dio.dart';
import 'package:password_saver/src/model/request/signup_request_model.dart';

class UserRepository {
  Dio dio = Dio();

  Future<Response> createUser(SignUpRequest request) async {
    Response response = await dio.post(
      'http://10.0.2.2:3500/api/auth/register',
      data: request,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 501;
        },
      ),
    );
    return response;
  }
}
