import 'package:flutter/material.dart';
import 'package:qrtest/Model/data_local_model.dart';
import 'package:qrtest/Model/data_model.dart';
import 'package:qrtest/utils/database.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  _InsertDattaState createState() => _InsertDattaState();
}

class _InsertDattaState extends State<InsertData> {
  var dbHalper = DatabaseHelper.db;

  final name = TextEditingController();
  final desk = TextEditingController();
  final prx = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              style: TextStyle(color: Colors.white, fontSize: 25),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
                counterStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'name',
                hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                fillColor: Colors.white,
                focusColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: desk,
              style: TextStyle(color: Colors.white, fontSize: 25),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
                counterStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'desk',
                hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                fillColor: Colors.white,
                focusColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: prx,
              style: TextStyle(color: Colors.white, fontSize: 25),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
                counterStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                hintText: 'prx',
                hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                fillColor: Colors.white,
                focusColor: Colors.white,
                hoverColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () async {
                  await dbHalper.inser(DatabseModel(
                      desk: desk.text, name: name.text, prx: prx.text));
                },
                child: Text(
                  "Inscret ",
                  //style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
