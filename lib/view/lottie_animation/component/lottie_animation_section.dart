import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:common/view_model/lottie_animation_view_model.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationSection extends GetWidget<LottieAnimationViewModel> {
  const LottieAnimationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset("assets/lottie/no_notification.json"),
        ],
      ),
    );
  }
}
