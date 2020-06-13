import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'dart:math';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:intl/intl.dart';

import '../constans.dart';
import '../datas/DATA_KHOAN_TIEN.dart';
import '../models/khoanChiCoDinh.dart';
import '../modules/drawer.dart';
import '../modules/chiTieuItem.dart';

class AddKhoanChiCoDinh extends StatefulWidget {
  @override
  _AddKhoanChiCoDinhState createState() => _AddKhoanChiCoDinhState();
}

class _AddKhoanChiCoDinhState extends State<AddKhoanChiCoDinh> {
  String _txtTieuDe = '';
  int _txtSoTien = 0;

  final controllerTieuDe = TextEditingController();
  final controllerSoTien = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 350,
          height: 80,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: kBackgroundColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            style: TextStyle(fontSize: 30, color: kBackgroundColor),
            textAlign: TextAlign.end,
            controller: controllerTieuDe,
            decoration: InputDecoration(
              hintText: 'Khoản chi tiêu',
              hintStyle: TextStyle(color: Colors.grey[350]),
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
            border: Border.all(width: 2, color: kBackgroundColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            style: TextStyle(fontSize: 30, color: kBackgroundColor),
            textAlign: TextAlign.end,
            keyboardType: TextInputType.number,
            controller: controllerSoTien,
            decoration: InputDecoration(
              hintText: 'Số tiền',
              hintStyle: TextStyle(color: Colors.grey[350]),
              border: InputBorder.none,
            ),
            onChanged: (text) {
              setState(() {
                _txtSoTien = int.parse(text);
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),

        Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Hexcolor('#FFCD46'),
            borderRadius: BorderRadius.circular(20),
          ),
          child: FlatButton(
            child: Text('ADD'),
            onPressed: () {
              var newKhoanChiCoDinh = KhoanChiCoDinh(
                id: Random().nextInt(1000),
                tieuDe: _txtTieuDe,
                soTien: _txtSoTien,
              );
              setState(() {
                KHOAN_CHI_CO_DINH.add(newKhoanChiCoDinh);
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
    );
  }
}
