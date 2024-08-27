import 'package:get/get.dart';
import 'package:getx_structure/modules/auth/presentation/bingdings/login_binding.dart';
import 'package:getx_structure/modules/auth/presentation/login_view.dart';
import 'package:getx_structure/modules/auth/presentation/signup_view.dart';
import 'package:getx_structure/modules/home/presentation/bindings/home_binding.dart';
import 'package:getx_structure/modules/home/presentation/home_page.dart';

part 'app_router.dart';

class AppPages {
  AppPages._();

  static const initPage = Routes.login;

  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterView(),
      binding: LoginBinding(),
    ),
    
  ];
}
