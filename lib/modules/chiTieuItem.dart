import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../constans.dart';
import '../models/khoanTien.dart';

class ChiTieuItem extends StatelessWidget {
  final KhoanTien khoantien;
  ChiTieuItem({this.khoantien});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
