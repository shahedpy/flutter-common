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
        title: const Text("Common"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoute.userPicker);
                },
                child: const Text("User Picker")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoute.lottieAnimation);
                },
                child: const Text("Lottie Animation"))
          ],
        ),
      ),
    );
  }
}
