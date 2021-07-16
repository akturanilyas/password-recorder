import 'package:jwt_decode/jwt_decode.dart';
import 'package:password_saver/src/utils/token_service.dart';

class IdService {
  Future<String> getId() async {
    TokenService token = TokenService();
    Map<String, dynamic> payload = Jwt.parseJwt(await token.getToken() ?? '');

    return payload['id'].toString();
  }
}
