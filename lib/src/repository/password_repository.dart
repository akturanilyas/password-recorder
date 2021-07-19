import 'package:dio/dio.dart';
import 'package:password_saver/src/model/password_model.dart';
import 'package:password_saver/src/model/request/edit_password_request_model.dart';
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

  Future<int> editPassword(EditPasswordRequest req) async {
    TokenService token = TokenService();
    IdService id = IdService();

    Response response = await dio.put(
      'http://10.0.2.2:3500/api/users/${await id.getId()}/password/${req.id}',
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

  Future<bool> deletePassword(String id) async {
    TokenService token = TokenService();
    IdService idService = IdService();

    Response response = await dio.delete(
      'http://10.0.2.2:3500/api/users/${await idService.getId()}/password/$id',
      options: Options(
        headers: {'auth-token': await token.getToken()},
        followRedirects: false,
        validateStatus: (status) {
          return status! < 501;
        },
      ),
    );

    if (response.statusCode == 202) {
      return true;
    }
    return false;
  }
}
