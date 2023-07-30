import 'package:common/model/user_model.dart';
import 'package:get/get.dart';

class UserPickerViewModel extends GetxController {
  RxList<UserModel> selectedUsers = <UserModel>[].obs;
  List<UserModel> users = [
    UserModel(
        name: "Shahed", email: "shahed@tiger-park.com", profilePicture: "url"),
    UserModel(
        name: "Rajib", email: "rajib@tiger-park.com", profilePicture: "url"),
    UserModel(
        name: "Shahriar",
        email: "shahriar@tiger-park.com",
        profilePicture: "url"),
    UserModel(
        name: "Dipto", email: "dipto@tiger-park.com", profilePicture: "url"),
    UserModel(
        name: "Meghla",
        email: "msultana@tiger-park.com",
        profilePicture: "url"),
  ];
}
