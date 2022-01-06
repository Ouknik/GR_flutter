import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrtest/Model/data_local_model.dart';
import 'package:qrtest/page/insert_data.dart';
import 'package:qrtest/utils/database.dart';

import 'qr_scanner.dart';

class QRCreate extends StatefulWidget {
  const QRCreate({Key? key}) : super(key: key);

  @override
  State<QRCreate> createState() => _QRCreateState();
}

class _QRCreateState extends State<QRCreate> {
  List<DatabseModel>? listLocal = [];
  var dbHalper = DatabaseHelper.db;

  getData() async {
    listLocal = await dbHalper.getAllProdects();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return InsertData();
                  }));
                },
                icon: Icon(Icons.qr_code))
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return QRScanner();
                }));
              },
              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              )),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Center(
              child: QrImage(
                data: listLocal!.length == 0
                    ? 'local is vid'
                    : listLocal![0].name,
                backgroundColor: Colors.white,
                size: 200,
              ),
            )
          ],
        ));
  }
}
