import 'package:flutter/material.dart';

import 'dart:math';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:intl/intl.dart';

import '../constans.dart';
import '../datas/DATA_KHOAN_TIEN.dart';
import '../models/khoanTien.dart';
import '../modules/drawer.dart';
import '../modules/chiTieuItem.dart';
import '../modules/addChiTieuItem.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          'assets/icons/add.png',
          width: 25,
          color: Colors.white,
        ),
        onPressed: () {
          _scaffoldKey.currentState.showBottomSheet((context) => Container(
                width: size.width,
                height: size.height * .45,
                color: kBackgroundColor,
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
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.only(left: 10),
                    width: 270,
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.pink[100]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Tien con: 10.000.000',
                            style: kInfoTextStyle.apply(color: Colors.green)),
                        Text(
                          'Tien chi: 15.000.000',
                          style: kInfoTextStyle.apply(color: Colors.red[200]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: KHOAN_TIEN.length,
                    itemBuilder: (context, index) {
                      KhoanTien khoantien = KHOAN_TIEN[index];

                      return Dismissible(
                        key: Key(khoantien.id.toString()),
                        onDismissed: (direction) {
                          setState(() {
                            KHOAN_TIEN.removeAt(index);
                          });
                          // Then show a snackbar.
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("${khoantien.tieuDe} đã xoá",style: TextStyle(fontSize: 20),)));
                        },
                        child: ChiTieuItem(khoantien: khoantien,) ,
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
