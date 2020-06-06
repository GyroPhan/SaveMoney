import 'dart:math';

import 'package:flutter/material.dart';
import '../constans.dart';
import '../datas/DATA_KHOAN_TIEN.dart';
import '../models/khoanTien.dart';
import 'package:intl/intl.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _txtTieuDe = '';
  int _txtSoTien = 0;
  bool _thuChi = false;
  final controllerTieuDe = TextEditingController();
  final controllerSoTien = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[DrawerHeader(), ListTile()],
        ),
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
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 350,
                      height: 80,
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: controllerTieuDe,
                        decoration: InputDecoration(
                          hintText: 'Tieu de',
                          border: InputBorder.none,
                        ),
                        onChanged: (text) {
                          setState(() {
                            _txtTieuDe = text;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 80,
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: controllerSoTien,
                        decoration: InputDecoration(
                          hintText: 'So tien',
                          border: InputBorder.none,
                        ),
                        onChanged: (text) {
                          setState(() {
                            _txtSoTien = int.parse(text);
                          });
                        },
                      ),
                    ),
                    Text(this._txtSoTien.toString()),
                    SizedBox(
                      height: 20,
                    ),
                    LiteRollingSwitch(
                      //initial value
                      value: true,
                      textOn: '  Chi',
                      textOff: 'Thu  ',
                      colorOn: Colors.redAccent[700],
                      colorOff: Colors.greenAccent[700],
                      iconOn: Icons.remove_circle_outline,
                      iconOff: Icons.done,
                      textSize: 16.0,
                      onChanged: (bool aaaa) {
                        this._thuChi = aaaa;
                        print('Current State of SWITCH IS: ${this._thuChi}');
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FlatButton(
                        child: Text('ADD'),
                        onPressed: () {
                          var newKhoanTien = KhoanTien(
                            id: Random().nextInt(1000),
                            tieuDe: _txtTieuDe,
                            soTien: _txtSoTien,
                            dcXai: _thuChi,
                            ngayTao: DateTime.now(),
                          );
                          setState(() {
                            KHOAN_TIEN.add(newKhoanTien);
                            controllerTieuDe.text = '';
                            controllerSoTien.text = '';
                            _txtSoTien = 0;
                            _txtTieuDe = '';
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ],
                ),
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
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/icons/menu.png',
                        width: 50,
                      ),
                    ),
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
                        child: GestureDetector(
                          onTap: () {
                            print('${khoantien.id} + ${khoantien.tieuDe}');
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            height: 90,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color:
                                      khoantien.dcXai ? kChiColor : kThuColor,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                    khoantien.dcXai
                                        ? 'assets/icons/minus.png'
                                        : 'assets/icons/plus.png',
                                    width: 40,
                                    color: khoantien.dcXai
                                        ? kChiColor
                                        : kThuColor),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      khoantien.tieuDe,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: khoantien.dcXai
                                            ? kChiColor
                                            : kThuColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      DateFormat('dd/MM/yyyy')
                                          .format(khoantien.ngayTao),
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      NumberFormat.currency(locale: 'vi')
                                          .format(khoantien.soTien)
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: khoantien.dcXai
                                              ? kChiColor
                                              : kThuColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
