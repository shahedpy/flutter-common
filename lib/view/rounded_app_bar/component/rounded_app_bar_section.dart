import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:common/view_model/rounded_app_bar_view_model.dart';

class RoundedAppBarSection extends GetWidget<RoundedAppBarViewModel> {
  const RoundedAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15.0),
          ),
        ),
        // titleSpacing: 40.0,
        // centerTitle: true,
        // elevation: 0,
        // flexibleSpace: const Image(
        //   image: NetworkImage(
        //       "https://images.unsplash.com/photo-1620641788421-7a1c342ea42e?ixlib=rb-4.0.3&dl=milad-fakurian-nY14Fs8pxT8-unsplash.jpg&q=80&fm=jpg&crop=entropy&cs=tinysrgb"),
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
