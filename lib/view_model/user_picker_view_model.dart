import 'package:get/get.dart';
import '../model/user_model.dart';

class UserPickerViewModel extends GetxController {
  RxList<UserModel> selectedUsers = <UserModel>[].obs;
  final List<UserModel> users = [
    UserModel(
        name: "Shahed",
        email: "shahed_hridoy@gmail.com",
        profilePicture: 'user1.jpg'),
    UserModel(
        name: "Nazim", email: "nazim@gmail.com", profilePicture: 'user2.jpg'),
    UserModel(
        name: "Shakil", email: "shakil@gmail.com", profilePicture: 'user3.jpg'),
    UserModel(
        name: "Rajib", email: "rajib@gmail.com", profilePicture: 'user4.jpg'),
  ];
}
