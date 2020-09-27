import 'package:flutter/material.dart';
import 'presentation/my_flutter_app_icons.dart';


class BtnNavBar extends StatefulWidget {
  @override
  _BtnNavBarState createState() => _BtnNavBarState();
}

class _BtnNavBarState extends State<BtnNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), title: Text("Recharge")),
          BottomNavigationBarItem(
              icon: Icon(MyCustomIcons.th_large_outline),
              title: Text("Services")),
          BottomNavigationBarItem(
              icon: Icon(MyCustomIcons.bookmark), title: Text("Benifits")),
          BottomNavigationBarItem(
              icon: Icon(MyCustomIcons.stream), title: Text("More")),
        ]);
  }
}
