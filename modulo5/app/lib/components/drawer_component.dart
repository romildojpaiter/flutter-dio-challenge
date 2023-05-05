import 'package:app_modulo_05/utils/app_routes.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  //

  void funcShowBottomSheet(context) {
    Navigator.of(context).pop();
    showBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Termos de uso',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Texto dos termos de uso',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void funcShowModalBottomSheet(context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: [
            ListTile(
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const ListTile(
              title: Text('Galeria'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2.0,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              funcShowModalBottomSheet(context);
            },
            child: const UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.orange),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                //child: Image.asset('assets/icons/steak-32.png'),
              ),
              accountName: const Text('Romildo Paiter'),
              accountEmail: const Text('romildopaiter@gmail.com'),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Lojas'),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed(AppRoutes.AUTH_HOME);
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_circle),
            title: const Text('Termos de uso'),
            onTap: () {
              funcShowBottomSheet(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Posts'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.POSTS);
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_rounded),
            title: const Text('Herois'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.HEROES);
            },
          ),
          Expanded(child: Container()),
          const ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            //onTap: () => Navigator.of(context).pushNamed(AppRoutes.PROFILE),
          )
        ],
      ),
    );
  }
}
