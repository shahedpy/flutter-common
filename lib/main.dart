import 'package:common/view/home/home_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:common/route/app_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
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
