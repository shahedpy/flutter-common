import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:common/view_model/lottie_animation_view_model.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationSection extends GetWidget<LottieAnimationViewModel> {
  const LottieAnimationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Animation"),
      ),
      body: Center(
        child: Lottie.asset("assets/lottie/no_notification.json"),
      ),
    );
  }
}
