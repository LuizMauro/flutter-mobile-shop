import 'package:get/get.dart';
import 'package:teste/src/pages/auth/repository/auth_repository.dart';
import 'package:teste/src/pages/auth/result/auth_result.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  AuthRepository authRepository = AuthRepository();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signin(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      print(user);
    }, error: (message) {
      print(message);
    });
  }
}
