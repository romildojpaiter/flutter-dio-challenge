import 'package:appgetxsample/pages/tarefas_getx_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2.0,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          // Contador MobX Default
          ListTile(
            title: const Row(
              children: [
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
                MaterialPageRoute(builder: (_) => TarefasGetXPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
