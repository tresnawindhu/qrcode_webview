import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

import './webview_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String kode = "";
  var getKode;
  Future scanBarcode() async {
    getKode = await BarcodeScanner.scan();
    setState(() {
      kode = getKode.rawContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("qrcode"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
          ),
          SizedBox(
            height: 12.0,
          ),

          Container(
          padding: EdgeInsets.all(20), 
          child:Image.asset("images/qr.png",),),
          
          FlatButton(
            onPressed: () {
              scanBarcode();
            },
            child: Container(
              width: 200,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Scan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.amber),
            ),
          ),
          FlatButton(
            onPressed: kode == ""
                ? () {}
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebScreen(kode),
                      ),
                    );
                  },
            child: Container(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: kode == ""
                      ? Text(
                          "Hasil",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        )
                      : Text(
                          kode,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
