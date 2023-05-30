import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modulo06app/pages/battery_page.dart';
import 'package:modulo06app/pages/conectivity_page.dart';
import 'package:modulo06app/pages/geolocator_page.dart';
import 'package:modulo06app/pages/image_picker/image_picker_page.dart';
import 'package:modulo06app/pages/qr_code_scanner/qr_code_scanner_page.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

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
          // Image Picker
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.camera,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text('Camera'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ImagePickerPage()),
              );
            },
          ),
          // QR Code Scanner
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.qrcode,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text('Leitor de QR Code'),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => QrCodeScannerPage()),
              );
            },
          ),
          // Battery Shower
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.batteryQuarter,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text('BATTERY_INFO').tr(),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BatteryPage()),
              );
            },
          ),
          // Abrir navegador
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.heart,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text("Abrir Ame Digital"),
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              await launchUrl(Uri.parse("https://amedigital.com"));
            },
          ),
          // Abrir Google Maps
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.map,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text("Abrir Google Maps"),
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              //await launchUrl(Uri.parse("google.navigation:q=$lat,$lng&mode=d"));
              await launchUrl(
                  Uri.parse("google.navigation:q=Cuiaba MT Br&mode=d"));
            },
          ),
          // Abrir Google Maps
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.shareNodes,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text("Compartilhar"),
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              Share.share('check out my website https://example.com',
                  subject: 'Look what I made!');
            },
          ),
          // Capturando Caminho do diretorio Temporario
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.folder,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text("Get Path Temp"),
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              var directory = await path_provider.getTemporaryDirectory();
              print(directory.path);
            },
          ),
          // Informações do app
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.appStore,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text("Informações"),
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              String appName = packageInfo.appName;
              String packageName = packageInfo.packageName;
              String version = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;

              print(appName);
              print(packageName);
              print(version);
              print(buildNumber);

              print(Platform.operatingSystem);
              print(Platform.isIOS);
            },
          ),
          // Informações do app
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.desktop,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text("Device"),
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
              if (Platform.isAndroid) {
                AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
              } else if (Platform.isIOS) {
                IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                print(
                    'Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
              } else {
                WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
                print('Running on ${webBrowserInfo.userAgent}');
              }
            },
          ),
          // Conectivity Info
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.networkWired,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text("Conectivity"),
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ConectivityPage()),
              );
            },
          ),
          // Geo Locator
          ListTile(
            title: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.locationDot,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text("Geo Locator"),
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GeoLocatorPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
