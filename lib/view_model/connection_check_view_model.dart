import 'dart:async';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionCheckViewModel extends GetxController {
  late RxBool isConnected;
  late StreamSubscription<InternetConnectionStatus> _connectionSubscription;
  RxBool showStatus = false.obs;

  @override
  void onInit() {
    _checkConnectivity();
    _connectionSubscription =
        InternetConnectionChecker().onStatusChange.listen((event) {
      isConnected.value = event == InternetConnectionStatus.connected;

      if (isConnected.value) {
        showStatus.value = true;
        Timer(const Duration(seconds: 3), () {
          showStatus.value = false;
        });
      } else {
        showStatus.value = true;
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }

  Future<void> _checkConnectivity() async {
    final isConnected_ = await InternetConnectionChecker().hasConnection;
    isConnected.value = isConnected_;
  }
}
