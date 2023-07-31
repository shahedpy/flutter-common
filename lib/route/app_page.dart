import 'package:common/view/connection_check/connection_check_view.dart';
import 'package:common/view/lottie_animation/lottie_animation_view.dart';
import 'package:common/view/user_picker/user_picker_view.dart';
import 'package:get/get.dart';
import '../view/home/home_view.dart';
import 'app_route.dart';

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
  ];
}
