import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PromoLandPage extends StatefulWidget {
  const PromoLandPage({super.key});

  @override
  State<PromoLandPage> createState() => _PromoLandPageState();
}

class _PromoLandPageState extends State<PromoLandPage> {
  //
  PageController pageController = PageController(initialPage: 0);
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
        body: PageView(
          controller: pageController,
          children: [
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.orange,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: Colors.amber,
              ),
              label: "Primary",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: Colors.blue,
              ),
              label: "Second",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: Colors.green,
              ),
              label: "Therty",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: Colors.orange,
              ),
              label: "Foorty",
            )
          ],
        ),
      ),
    );
  }
}
