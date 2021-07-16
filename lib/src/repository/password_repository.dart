import 'package:dio/dio.dart';
import 'package:password_saver/src/model/request/password_request_model.dart';
import 'package:password_saver/src/utils/id_service.dart';
import 'package:password_saver/src/utils/token_service.dart';

class PasswordRepository {
  Dio dio = Dio();

  Future<int> createPassword(PasswordRequest req) async {
    TokenService token = TokenService();
    IdService id = IdService();
    
    Response response = await dio.post(
      'http://10.0.2.2:3500/api/users/${await id.getId()}/password',
      data: req,
      options: Options(
        headers: {'auth-token': await token.getToken()},
        followRedirects: false,
        validateStatus: (status) {
          return status! < 501;
        },
      ),
    );

    if (response.statusCode != 200) {}
    return response.statusCode!;
  }

  Future<void> getOnePassword() async {}
  Future<void> getAllPassword() async {}
  Future<void> deletePassword() async {}
}
