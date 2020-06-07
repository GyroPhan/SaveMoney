import 'package:flutter/material.dart';
import '../modules/sixBottleItem.dart';

class SixBottle extends StatefulWidget {
  @override
  _SixBottleState createState() => _SixBottleState();
}

class _SixBottleState extends State<SixBottle> {
  int _txtSoTien = 0;
  int _nhuCau = 0;
  int _giaoDuc = 0;
  int _huongThu = 0;
  int _tuDo = 0;
  int _tietKiem = 0;
  int _giupDo = 0;

  int _pcNhuCau = 55;
  int _pcGiaoDuc = 10;
  int _pcHuongThu = 10;
  int _pcTuDo = 10;
  int _pcTietKiem = 10;
  int _pcGiupDo = 5;

  final controllerSoTien = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: size.width * .9,
              height: 60,
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 30, color: Colors.green),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey[350]),
                  hintText: 'Nhập số tiền cần tính',
                  border: InputBorder.none,
                ),
                controller: controllerSoTien,
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  _txtSoTien = int.parse(text);
                  _nhuCau = (_txtSoTien * _pcNhuCau) ~/ 100;
                  _giaoDuc = (_txtSoTien * _pcGiaoDuc) ~/ 100;
                  _huongThu = (_txtSoTien * _pcHuongThu) ~/ 100;
                  _tuDo = (_txtSoTien * _pcTuDo) ~/ 100;
                  _tietKiem = (_txtSoTien * _pcTietKiem) ~/ 100;
                  _giupDo = (_txtSoTien * _pcGiupDo) ~/ 100;
                  setState(() {});
                },
              ),
            ),
            SixBottleItem(
              title: 'Nhu cầu thiết yếu',
              percent: _pcNhuCau,
              money: _nhuCau,
            ),
            SixBottleItem(
              title: 'Giáo dục',
              percent: _pcGiaoDuc,
              money: _giaoDuc,
            ),
            SixBottleItem(
              title: 'Hưởng thụ',
              percent: _pcHuongThu,
              money: _huongThu,
            ),
            SixBottleItem(
              title: 'Tự do Tài chính',
              percent: _pcTuDo,
              money: _tuDo,
            ),
            SixBottleItem(
              title: 'Tiết kiệm dài hạn',
              percent: _pcTietKiem,
              money: _tietKiem,
            ),
            SixBottleItem(
              title: 'Giúp đỡ người khác',
              percent: _pcGiupDo,
              money: _giupDo,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                  child: FlatButton(
                      child: Text('OK'),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      }),
                ),

              ],
            ),
          ],
        ),
      )),
    );
  }
}
