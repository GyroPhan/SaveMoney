import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'dart:math';
import 'package:intl/intl.dart';

import '../constans.dart';
import '../datas/DATA_KHOAN_TIEN.dart';

import '../models/khoanChiCoDinh.dart';
import '../modules/addKhoanChiCoDinh.dart';
import '../modules/chiCoDinhItems.dart';

class TotalScreen extends StatefulWidget {
  @override
  _TotalScreenState createState() => _TotalScreenState();
}

class _TotalScreenState extends State<TotalScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _txtSoTienChi = 0;
  bool checkValue = true;
  final controllerSoTienChi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kChiColor,
        foregroundColor: Colors.redAccent,
        child: Image.asset(
          'assets/icons/add.png',
          width: 25,
          color: kBackgroundColor,
        ),
        onPressed: () {
          _scaffoldKey.currentState.showBottomSheet((context) => Container(
                width: size.width,
                height: size.height * .40,
                color: Colors.grey[100],
                child: AddKhoanChiCoDinh(),
              ));
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/icons/back.png',
                        width: 40,
                        color: Hexcolor('#FFCD46'),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 80,
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: kThuColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 30, color: kThuColor),
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      controller: controllerSoTienChi,
                      decoration: InputDecoration(
                        hintText: 'Số tiền',
                        hintStyle: TextStyle(color: Colors.grey[350]),
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        setState(() {
                          _txtSoTienChi = int.parse(text);
                        });
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 40),
                child: Text(
                  'Các khoản chi cần thiết:',
                  style: TextStyle(
                      color: Hexcolor('#FD2540'),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: KHOAN_CHI_CO_DINH.length,
                    itemBuilder: (context, index) {
                      KhoanChiCoDinh khoanTienCoDinh = KHOAN_CHI_CO_DINH[index];
                      return Container(
                        margin: EdgeInsets.only(left: 40, right: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              khoanTienCoDinh.tieuDe,
                              style: TextStyle(
                                  color: kChiColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              khoanTienCoDinh.soTien.toString(),
                              style: TextStyle(
                                  color: kChiColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Checkbox(
                              checkColor: kChiColor,
                              activeColor: kChiColor,
                              value: khoanTienCoDinh.isChecked,
                              onChanged: (bool value) {
                               setState(() {
                                 khoanTienCoDinh.isChecked = value;
                                 print('${khoanTienCoDinh.tieuDe} + ${khoanTienCoDinh.isChecked}');
                               });
                              },
                            ),
                          ],
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
