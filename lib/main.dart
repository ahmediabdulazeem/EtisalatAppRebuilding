import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:etisalt_samulation/home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'BtnNavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var userName = "احمد ابراهيم";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'welcome,' + " " + userName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Material(child: myScaffold(widget.title, context));
  }
}

Scaffold myScaffold(title, context) {
  return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Color(0xff0d6a3f), Color(0xff248948)])),
        ),
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        leading: Icon(Icons.wb_sunny, size: 30),
        actions: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.add_alert,
                size: 30,
              )),
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.search,
                size: 30,
              )),
        ],
      ),
      body: SlidingUpPanel(
        minHeight: 80,
        maxHeight: 300,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        backdropEnabled: true,
        panel: Center(
          child: Column(
            children: <Widget>[
              Icon(Icons.menu),
              CarouselSlider(
                  items: [
                    circularImage(70, 70, "images/cash.png"),
                    circularImage(70, 70, "images/cash.png"),
                    circularImage(70, 70, "images/cash.png"),
                  ],
                  options: CarouselOptions(
                    height: 100,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.28,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
              adsContainer(context)
            ],
          ),
        ),
        body: HomePage(),
      ),
      bottomNavigationBar: BtnNavBar());
}
