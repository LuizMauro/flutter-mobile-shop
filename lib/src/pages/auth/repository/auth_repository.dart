import 'package:teste/src/constants/endpoints.dart';
import 'package:teste/src/models/user_model.dart';
import 'package:teste/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signin({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);

      return user;
    } else {
      print('Signin não funcionou');
    }
  }
}
