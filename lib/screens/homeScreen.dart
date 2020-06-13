import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'dart:math';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:intl/intl.dart';

import '../constans.dart';
import '../datas/DATA_KHOAN_TIEN.dart';
import '../models/khoanTien.dart';
import '../modules/drawer.dart';
import '../modules/chiTieuItem.dart';
import '../modules/addChiTieuItem.dart';
import '../screens/totalScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //////////////////////////////////////////////////////////////////////////////////

  String data;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/money_app.txt');
  }

  Future<String> readContent() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      // Returning the contents of the file
      return contents;
    } catch (e) {
      // If encountering an error, return
      return 'Error!';
    }
  }

  Future<File> writeContent() async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('Hello Folk');
  }
  ///////////////////////////////////////////////////////////////////////////////////

  tienChi() {
    if (KHOAN_TIEN.length == 0) {
      return 0;
    } else {
      var sum = 0;
      for (var i = 0; i < KHOAN_TIEN.length; i++) {
        sum += KHOAN_TIEN[i].soTien;
      }
      ;
      return sum;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      key: _scaffoldKey,
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Hexcolor('#FFCD46'),
        foregroundColor: Colors.redAccent,
        child: Image.asset(
          'assets/icons/add.png',
          width: 25,
          color: kBackgroundColor,
        ),
        onPressed: () {
          _scaffoldKey.currentState.showBottomSheet((context) => Container(
                width: size.width,
                height: size.height * .45,
                color: Colors.grey[100],
                child: AddChiTieu(),
              ));
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child: DrawerIcon(),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(left: 10),
                      width: 270,
                      height: 80,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 3, color: Hexcolor('#FFCD46')),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Tien con: ${4000000-tienChi()}',
                              style: kInfoTextStyle.apply(
                                  color: Hexcolor('#45FFBE'))),
                          Text(
                            'Tien chi: ${tienChi()}',
                            style: kInfoTextStyle.apply(
                                color: Hexcolor('#FF5C70')),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TotalScreen()),
                      );
                    },
                  ),
                ],
              ),
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: KHOAN_TIEN.length,
                    itemBuilder: (context, index) {
                      KhoanTien khoantien = KHOAN_TIEN[index];

                      return Dismissible(
                        key: Key(khoantien.id.toString()),
                        onDismissed: (direction) {
                          // Then show a snackbar.
                          setState(() {
                            KHOAN_TIEN.removeAt(index);
                          });
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                            "${khoantien.tieuDe} đã xoá",
                            style: TextStyle(fontSize: 20),
                          )));
                        },
                        child: ChiTieuItem(
                          khoantien: khoantien,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
