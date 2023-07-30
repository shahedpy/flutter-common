import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:common/view_model/user_picker_view_model.dart';
import 'package:common/model/user_model.dart';

class UserPickerSection extends GetWidget<UserPickerViewModel> {
  final TextEditingController _typeAheadController = TextEditingController();

  UserPickerSection({super.key});

  List<UserModel> _getFilteredUsers(String pattern) {
    return controller.users.where((user) {
      final nameMatch = user.name.toLowerCase().contains(pattern.toLowerCase());
      final username = user.email.split('@')[0].toLowerCase();
      final emailMatch = username.contains(pattern.toLowerCase());
      return nameMatch || emailMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
