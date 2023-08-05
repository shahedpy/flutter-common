import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../view_model/login_view_model.dart';

class LoginSection extends GetWidget<LoginViewModel> {
  const LoginSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  onChanged: (value) => controller.username.value = value,
                  decoration: const InputDecoration(
                    hintText: "Username",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  onChanged: (value) => controller.password.value = value,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.validateLogin(),
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
