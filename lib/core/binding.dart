import 'package:common/view_model/user_picker_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserPickerViewModel());
  }
}
