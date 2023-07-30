import 'package:common/view/lottie_animation/lottie_animation_view.dart';
import 'package:get/get.dart';
import '../view/home/home_view.dart';
import 'app_route.dart';

abstract class AppPage {
  static const initial = AppRoute.home;
  static final routes = [
    GetPage(name: AppRoute.home, page: () => const HomeView()),
    GetPage(
        name: AppRoute.lottieAnimation,
        page: () => const LottieAnimationView()),
  ];
}
