import 'package:flutter/material.dart';

import 'dart:math';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:intl/intl.dart';

import '../constans.dart';
import '../datas/DATA_KHOAN_TIEN.dart';
import '../models/khoanTien.dart';
import '../modules/drawer.dart';
import '../modules/chiTieuItem.dart';

class AddChiTieu extends StatefulWidget {
  @override
  _AddChiTieuState createState() => _AddChiTieuState();
}

class _AddChiTieuState extends State<AddChiTieu> {
  String _txtTieuDe = '';
  int _txtSoTien = 0;
  bool _thuChi = false;
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
    );
  }
}
