import 'package:flutter/material.dart';

import '../modules/drawer.dart';
import '../screens/sixBottle.dart';

class SaveMoneyScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body: SafeArea(
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SixBottle()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/icons/bottle.png',
                      width: 50,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
