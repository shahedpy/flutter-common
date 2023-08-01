import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/view_model/user_picker_view_model.dart';

import '../../../model/user_model.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("User Picker"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TypeAheadField<UserModel>(
              textFieldConfiguration: const TextFieldConfiguration(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter user name",
                ),
              ),
              suggestionsCallback: (pattern) async {
                if (pattern.isEmpty) {
                  return <UserModel>[];
                }
                return _getFilteredUsers(pattern);
              },
              itemBuilder: (context, UserModel suggestion) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(suggestion.profilePicture),
                  ),
                  title: Text(suggestion.name),
                  subtitle: Text(suggestion.email),
                );
              },
              onSuggestionSelected: (UserModel suggestion) {
                if (!controller.selectedUsers.contains(suggestion)) {
                  controller.selectedUsers.add(suggestion);
                  _typeAheadController.clear(); // Clear the text input field
                }
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Selected Users:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                itemCount: controller.selectedUsers.length,
                itemBuilder: (context, index) {
                  final user = controller.selectedUsers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(user.profilePicture),
                    ),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        controller.selectedUsers.removeAt(index);
                      },
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
