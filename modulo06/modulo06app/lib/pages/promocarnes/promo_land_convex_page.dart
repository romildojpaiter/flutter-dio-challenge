import 'package:brasil_fields/brasil_fields.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:modulo06app/pages/brasil_fields/brasil_fields_page.dart';

class PromoLandConvexPage extends StatefulWidget {
  const PromoLandConvexPage({super.key});

  @override
  State<PromoLandConvexPage> createState() => _PromoLandConvexPageState();
}

class _PromoLandConvexPageState extends State<PromoLandConvexPage>
    with TickerProviderStateMixin {
  //
  late var _tabController;
  var _f = NumberFormat('#,###.0#', 'en_US');
  var _fBr = NumberFormat('#,###.0#', 'pt_BR');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Promocarnes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.grey,
              child: Column(
                children: [
                  Text(_f.format(1200.345)),
                  Text(_fBr.format(1200.345))
                ],
              ),
            ),
            BrasilFieldsPage(),
          ],
        ),
        bottomNavigationBar: ConvexAppBar.badge(
          {0: '99+', 1: Icons.assistant_photo, 2: Colors.green, 3: 'Hot'},
          backgroundColor: Colors.red,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          onTap: (int index) => _tabController.index = index,
          controller: _tabController,
        ),
      ),
    );
  }
}
