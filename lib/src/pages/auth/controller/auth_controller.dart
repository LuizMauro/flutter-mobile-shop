import 'package:get/get.dart';
import 'package:teste/src/models/user_model.dart';
import 'package:teste/src/pages/auth/repository/auth_repository.dart';
import 'package:teste/src/pages/auth/result/auth_result.dart';
import 'package:teste/src/services/utils_service.dart';

import '../../../constants/storage_keys.dart';
import '../../../pages_routes/app_pages.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  AuthRepository authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  void saveTokenAndProceedToBase() async {
    await utilsServices.saveLocalData(
      key: StorageKeys.tokenKey,
      value: user.token!,
    );
    Get.offAllNamed(PagesRoutes.baseScreenRoute);
  }

  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(key: StorageKeys.tokenKey);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: 'Sua sessão expirou, entre novamente',
          isError: true,
        );
        signOut();
      },
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signin(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) async {
      this.user = user;
      saveTokenAndProceedToBase();
    }, error: (message) {
      utilsServices.showToast(
        message: message,
        isError: true,
      );
    });
  }

  Future<void> signOut() async {
    //limpando user
    user = UserModel();

    //remover token
    await utilsServices.removeLocalData(key: StorageKeys.tokenKey);

    // ir para login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }
}
