import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constans.dart';
import '../screens/homeScreen.dart';
import '../screens/saveMoneyScreen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(),
        ListTile(
          title: Text('Home', style: kDrawerStyle,),
          onTap: (){
            Navigator.push(context,
                 MaterialPageRoute(builder: (context) =>  HomeScreen()));
          },
        ),
        ListTile(
          title: Text('Save Money', style: kDrawerStyle,),
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  SaveMoneyScreen()));
          },
        ),
      ],
    );
  }
}

class DrawerIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child:Image.asset(
        'assets/icons/menu.png',
        width: 40,
        color: Hexcolor('#FFCD46'),
      ),
    );
  }
}
