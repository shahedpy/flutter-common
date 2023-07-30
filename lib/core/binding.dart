import 'package:common/view_model/home_view_model.dart';
import 'package:common/view_model/lottie_animation_view_model.dart';
import 'package:common/view_model/user_picker_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => UserPickerViewModel());
    Get.lazyPut(() => LottieAnimationViewModel());
  }
}
