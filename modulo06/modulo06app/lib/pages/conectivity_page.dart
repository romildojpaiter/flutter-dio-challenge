import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConectivityPage extends StatefulWidget {
  const ConectivityPage({super.key});

  @override
  State<ConectivityPage> createState() => _ConectivityPageState();
}

class _ConectivityPageState extends State<ConectivityPage> {
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        // Got a new connectivity status!
        print(result);
      },
    );
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Conectividade"),
        ),
        body: Column(
          children: [
            Container(),
            TextButton(
              onPressed: () async {
                final connectivityResult =
                    await (Connectivity().checkConnectivity());
                if (connectivityResult == ConnectivityResult.mobile) {
                  // I am connected to a mobile network.
                  print(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.wifi) {
                  // I am connected to a wifi network.
                  print(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.ethernet) {
                  // I am connected to a ethernet network.
                  print(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.vpn) {
                  // I am connected to a vpn network.
                  // Note for iOS and macOS:
                  // There is no separate network interface type for [vpn].
                  // It returns [other] on aprint(connectivityResult);
                  //print(connectivityResult);ny device (also simulator)
                  print(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.bluetooth) {
                  // I am connected to a bluetooth.
                  print(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.other) {
                  // I am connected to a network which is not in the above mentioned networks.
                  print(connectivityResult);
                } else if (connectivityResult == ConnectivityResult.none) {
                  // I am not connected to any network.
                  print(connectivityResult);
                }
              },
              child: Text("Verificar Conexão"),
            )
          ],
        ),
      ),
    );
  }
}
