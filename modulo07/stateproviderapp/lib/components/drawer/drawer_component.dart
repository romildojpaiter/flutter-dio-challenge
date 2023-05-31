import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stateprovider/page/tasks/tasks_page.dart';

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
              children: const [
                FaIcon(
                  FontAwesomeIcons.listCheck,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Tarefas'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TasksPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
