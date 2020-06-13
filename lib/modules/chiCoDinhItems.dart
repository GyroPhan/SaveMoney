import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'dart:math';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:intl/intl.dart';

import '../constans.dart';
import '../datas/DATA_KHOAN_TIEN.dart';
import '../models/khoanTien.dart';
import '../modules/drawer.dart';
import '../modules/chiTieuItem.dart';
import '../modules/addChiTieuItem.dart';
import '../models/khoanChiCoDinh.dart';

class ChiCoDinhItems extends StatefulWidget {

  @override
  _ChiCoDinhItemsState createState() => _ChiCoDinhItemsState();
}

class _ChiCoDinhItemsState extends State<ChiCoDinhItems> {
  final KhoanChiCoDinh khoanTienCoDinh;
  _ChiCoDinhItemsState({this.khoanTienCoDinh});
  @override
  Widget build(BuildContext context) {
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
  }
}
