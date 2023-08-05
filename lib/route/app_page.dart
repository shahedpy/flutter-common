import 'app_route.dart';
import 'package:get/get.dart';
import '../view/home/home_view.dart';
import '../view/login_form/login_view.dart';
import '../view/user_picker/user_picker_view.dart';
import '../view/connection_check/connection_check_view.dart';
import '../view/lottie_animation/lottie_animation_view.dart';

abstract class AppPage {
  static const initial = AppRoute.home;
  static final routes = [
    GetPage(
      name: AppRoute.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoute.userPicker,
      page: () => const UserPickerView(),
    ),
    GetPage(
      name: AppRoute.lottieAnimation,
      page: () => const LottieAnimationView(),
    ),
    GetPage(
      name: AppRoute.connectionCheck,
      page: () => const ConnectionCheckView(),
    ),
    GetPage(
      name: AppRoute.loginForm,
      page: () => const LoginView(),
    ),
  ];
}
