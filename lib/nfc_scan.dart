import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:oeresound/nfc_display.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcScan extends StatefulWidget {
  @override
  _NfcScanState createState() => _NfcScanState();
}

class _NfcScanState extends State<NfcScan> {
  @override

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            NfcManager.instance.stopSession();
            _nextPage(context);
          }
      ),
      builder: (context, ss) => Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Lottie.asset("assets/json/nfc_loader.json"),
                      onTap:() => _nextPage(context),
                    ),
                    Text("Hold telefonen mod armbåndet",
                        style: TextStyle(fontSize: 18)
                    )
                  ],
                ),
              ),
            ]
        )
    );
  }

  void _nextPage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) {
              return NfcDisplay();
            }
        )
    );
  }
}
