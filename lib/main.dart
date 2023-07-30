import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Common',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
