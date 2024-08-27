import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure/core/assets/locale_keys.g.dart';
import 'package:getx_structure/core/core.dart';
import 'package:getx_structure/modules/auth/domain/usecases/login_usecase.dart';
import 'package:getx_structure/routers/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  var accessToken = ''.obs;
  var refreshToken = ''.obs;
  RxBool isLoading = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyCodeController = TextEditingController();
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode companyCodeFocus = FocusNode();

  var isFocusUsername = false.obs;
  var isFocusPassword = false.obs;
  var isFocusCompanyCode = false.obs;

  LoginController({required this.loginUseCase});

  @override
  void onInit() {
    super.onInit();
    usernameFocus.addListener(() {
      isFocusUsername.value = usernameFocus.hasFocus;
    });
    passwordFocus.addListener(() {
      isFocusPassword.value = passwordFocus.hasFocus;
    });
    companyCodeFocus.addListener(() {
      isFocusCompanyCode.value = companyCodeFocus.hasFocus;
    });
    companyCodeController.text = "Q6xxN7I8uQ";
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    companyCodeController.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
    companyCodeFocus.dispose();
    super.onClose();
  }

  void showErrorDialog(String message) {
    Get.dialog(
      AlertDialog(
        title: Text(LocaleKeys.noti.trans()),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> handleLogin() async {
    final username = usernameController.text;
    final password = passwordController.text;
    

    if (username.isEmpty && password.isEmpty) {
      showErrorDialog(LocaleKeys.pleaseEnterUsernamePassword.trans());
      return;
    } else if (username.isEmpty) {
      showErrorDialog(LocaleKeys.enterUserName.trans());
      return;
    } else if (password.isEmpty) {
      showErrorDialog(LocaleKeys.enterPassword.trans());
      return;
    }

    isLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    final response = await loginUseCase.login(username, password);
    response.fold(
      (l) {
        showErrorDialog(l.message);
        isLoading(false);
      },
      (r) async {
        debugPrint('Login Success');
        accessToken.value = r.accessToken ?? '';
        refreshToken.value = r.refreshToken ?? '';
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', r.accessToken ?? '');
        await prefs.setString('refreshToken', r.refreshToken ?? '');
        debugPrint('AccessToken: ${accessToken.value}');
        debugPrint('RefreshToken: ${refreshToken.value}');
        await Get.toNamed(Routes.home);
        usernameController.clear();
        passwordController.clear();
        isLoading(false);
      },
    );
  }
}
