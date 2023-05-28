import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  // final Battery _battery = Battery();

  // BatteryState? _batteryState;
  // StreamSubscription<BatteryState>? _batteryStateSubscription;
  // var batteryInfo = "";

  // @override
  // void initState() {
  //   super.initState();
  //   _battery.batteryState.then(_updateBatteryState);
  //   _batteryStateSubscription =
  //       _battery.onBatteryStateChanged.listen(_updateBatteryState);
  // }

  // void _updateBatteryState(BatteryState state) {
  //   if (_batteryState == state) return;
  //   setState(() {
  //     _batteryState = state;
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text("BATTERY_INFO").tr(),
  //       ),
  //       body: Container(
  //           child: Center(
  //         child: Text("Porcentagem da bateria: $_batteryState"),
  //       )),
  //     ),
  //   );
  // }

  final Battery _battery = Battery();

  BatteryState? _batteryState;
  StreamSubscription<BatteryState>? _batteryStateSubscription;

  @override
  void initState() {
    super.initState();
    _battery.batteryState.then(_updateBatteryState);
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen(_updateBatteryState);
  }

  void _updateBatteryState(BatteryState state) {
    if (_batteryState == state) return;
    setState(() {
      _batteryState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery plus example app'),
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_batteryState',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _battery.batteryLevel.then(
                  (batteryLevel) {
                    showDialog<void>(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: Text('Battery: $batteryLevel%'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Get battery level'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _battery.isInBatterySaveMode.then(
                  (isInPowerSaveMode) {
                    showDialog<void>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text(
                          'Is in Battery Save mode?',
                          style: TextStyle(fontSize: 20),
                        ),
                        content: Text(
                          "$isInPowerSaveMode",
                          style: const TextStyle(fontSize: 18),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Is in Battery Save mode?'),
            ),
            SizedBox(height: 20),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width,
              animation: true,
              lineHeight: 20,
              animationDuration: 2000,
              percent: 0.8,
              center: Text("90%"),
              progressColor: Colors.greenAccent,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription!.cancel();
    }
  }
}
