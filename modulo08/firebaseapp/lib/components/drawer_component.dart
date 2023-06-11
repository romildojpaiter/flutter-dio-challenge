import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Text("header"),
          )
        ],
      ),
    );
  }
}
