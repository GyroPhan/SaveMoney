import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SixBottleItem extends StatelessWidget {
  String title ;
  int money ;
  int percent;
  SixBottleItem({this.title, this.money,this.percent});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top:20),
      width: size.width * .9,
      height: 70,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[500]),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  this.title,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '(${this.percent}%)',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    NumberFormat.currency(locale: 'vi')
                        .format(this.money)
                        .toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[300]),
                  )))
        ],
      ),
    );
  }
}
