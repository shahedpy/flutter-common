import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:common/view_model/connection_check_view_model.dart';

class ConnectionCheckSection extends GetWidget<ConnectionCheckViewModel> {
  const ConnectionCheckSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text("Connection Check"),
          ),
          body: const Text("Connection Check"),
          bottomNavigationBar: controller.showStatus.value
              ? controller.isConnected.value
                  ? BottomAppBar(
                      child: Container(
                        height: 24,
                        color: Colors.green,
                        child: const Text(
                          "Back Online",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    )
                  : BottomAppBar(
                      child: Container(
                        height: 24,
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            "No Connection",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
              : const BottomAppBar(),
        ));
  }
}
