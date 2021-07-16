import 'package:dio/dio.dart';
import 'package:password_saver/src/model/password_model.dart';
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

    return response.statusCode!;
  }

  Future<void> getOnePassword() async {}

  Future<List<Password>> getAllPassword() async {
    List<Password> myPasswords = [];
    TokenService token = TokenService();
    IdService id = IdService();

    Response response = await dio.get(
      'http://10.0.2.2:3500/api/users/${await id.getId()}/password',
      options: Options(
        headers: {'auth-token': await token.getToken()},
        followRedirects: false,
        validateStatus: (status) {
          return status! < 501;
        },
      ),
    );
    for (final Map<String, dynamic> password in response.data['passwords']) {
      myPasswords.add(Password.fromJson(password));
    }

    return myPasswords;
  }

  Future<void> deletePassword() async {}
}
