import 'package:common/route/app_route.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:common/view_model/home_view_model.dart';

class HomeSection extends GetWidget<HomeViewModel> {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Common"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoute.userPicker),
                child: const Text("User Picker"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoute.lottieAnimation),
                child: const Text("Lottie Animation"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoute.connectionCheck),
                child: const Text("Connectivity Check"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoute.loginForm),
                child: const Text("Login Form"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoute.roundedAppBar),
                child: const Text("Rounded App Bar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
