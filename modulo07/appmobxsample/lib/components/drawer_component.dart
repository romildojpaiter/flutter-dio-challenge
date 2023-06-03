import 'package:appmobxsample/pages/contador/contador_annoted_mobx_page.dart';
import 'package:appmobxsample/pages/contador/contador_mobx_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
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
                  FontAwesomeIcons.listOl,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Contador'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ContadorMobXPage()),
              );
            },
          ),
          // Contador MobX CodeGen
          ListTile(
            title: const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.listUl,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Contador (Annoted)'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ContadorAnnotedMobXPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
