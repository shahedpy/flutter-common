import 'package:common/view/home/home_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:common/route/app_page.dart';
import 'dart:async';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.initial,
      initialBinding: Binding(),
      getPages: AppPage.routes,
      home: const HomeView(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Internet Connectivity
  late bool _isConnected;
  late StreamSubscription<InternetConnectionStatus> _connectionSubscription;
  bool _showStatus = false;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _connectionSubscription =
        InternetConnectionChecker().onStatusChange.listen((event) {
      setState(() {
        _isConnected = event == InternetConnectionStatus.connected;
      });
      if (_isConnected) {
        _showStatus = true;
        Timer(const Duration(seconds: 3), () {
          setState(() {
            _showStatus = false;
          });
        });
      } else {
        _showStatus = true;
      }
    });
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Common'),
        ),
        bottomNavigationBar: _showStatus
            ? _isConnected
                ? BottomAppBar(
                    child: Container(
                      height: 24,
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          "Back online",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : BottomAppBar(
                    child: Container(
                      height: 24,
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          "No connection",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
            : const BottomAppBar(),
      ),
    );
  }

  Future<void> _checkConnectivity() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    setState(() {
      _isConnected = isConnected;
    });
  }
}
