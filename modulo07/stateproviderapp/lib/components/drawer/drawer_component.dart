import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Row(
              children: [
                // FaIcon(
                //   FontAwesomeIcons.camera,
                //   size: 24,
                // ),
                SizedBox(
                  width: 10,
                ),
                const Text('Camera'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (_) => ImagePickerPage()),
              // );
            },
          )
        ],
      ),
    );
  }
}
