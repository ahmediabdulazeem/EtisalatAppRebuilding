import 'package:etisalt_samulation/presentation/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller;
  double initTogaleMenuHight;
  double initInfoCardWidth = 300;
  double initRaduisValue = 20;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        initTogaleMenuHight = 0;
        initInfoCardWidth = 300;
        initRaduisValue = 20;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        initTogaleMenuHight = 40;
        initInfoCardWidth = MediaQuery.of(context).size.width;
        initRaduisValue = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    num substractedValue = MediaQuery.of(context).size.height - 85;
    int myBackGroundColor = 0xFFf4f4f4;
    //int appBarColor = 0xFF0d6a3f;

    return Container(
        color: Color(myBackGroundColor),
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Color(0xff248948), Color(0xff43b156)])),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - substractedValue,
                child: Center(
                  child: InfoTab(context, initInfoCardWidth, initRaduisValue),
                )),
            Stack(
              children: <Widget>[
                Container(
                  //container which contain usage and ads
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 160,
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: Column(
                      children: <Widget>[
                        //chart & balance
                        usageContainer(context, 65),
                        sepratedContainer(context),
                        //ads dma8 tany
                        adsContainer(context),
                        SizedBox.fromSize(size: Size.square(150))
                      ],
                    ),
                  ),
                ),
                Center(
                  child: toggleContainerWithAnime(context, initTogaleMenuHight),
                ),
              ],
            ),
          ],
        ));
  }
}

Container sepratedContainer(context) {
  return Container(width: MediaQuery.of(context).size.width, height: 30);
}

Stack adsContainer(context) {
  //var endGreen = 0xFF08556c;
  //var green = 0xFF059a99;

  return Stack(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 40, left: 200),
        child: Image.asset("images/2.png"),
        height: 100,
        width: 100,
      ),
      Container(
        child: Column(children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Customize your bundle now",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.white),
                ),
                SizedBox.fromSize(
                  size: Size(20, 20),
                ),
                Text(
                  "Migrate to Demagh Tanya and get",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.white),
                ),
                SizedBox.fromSize(size: Size(10, 10)),
                Row(
                  children: <Widget>[
                    Text(
                      "Double Quates ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                    Text(
                      "NOW !",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                          color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 30, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Migrate now",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox.fromSize(
                    size: Size.square(7),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                    color: Colors.white,
                  )
                ],
              ))
        ]),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(8, 88, 110, 50),
              Color.fromRGBO(5, 154, 153, 50),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.width - 200,
        width: MediaQuery.of(context).size.width - 40,
      )
    ],
  );
}

Container usageContainer(context, double marginVal) {
  var cardHieght = MediaQuery.of(context).size.width + 40;
  var cardWidth = MediaQuery.of(context).size.width - 40;
  var boarderRaduis = BorderRadius.all(Radius.circular(20));

  return Container(
    child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.all(10),
          child: Text(
            "My Usage",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ),
        Container(
            child: Container(width: 250, height: 250, child: radialChart())),
        Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        child: Icon(
                      MyCustomIcons.arrows_cw,
                      size: 15,
                    )),
                    SizedBox.fromSize(
                      size: Size(10, 10),
                    ),
                    Text("Refreshed 1 minute ago")
                  ],
                )),
            Icon(Icons.keyboard_arrow_down),
            Container(
                decoration: BoxDecoration(
                    borderRadius: boarderRaduis,
                    color: Color.fromRGBO(225, 220, 220, 50)),
                height: 69,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_balance_wallet,
                      size: 35,
                      color: Colors.grey,
                    ),
                    SizedBox.fromSize(size: Size.square(10)),
                    Text(
                      "balance:",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      " " + "0.00",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(" " + "EGP"),
                    SizedBox.fromSize(
                      size: Size.square(25),
                    ),
                    InkWell(
                        borderRadius: boarderRaduis,
                        child: Text("Recharge Now",
                            style: TextStyle(color: Colors.green)))
                  ],
                )),
          ],
        )
      ],
    ),
    margin: EdgeInsets.only(top: marginVal),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    height: cardHieght,
    width: cardWidth,
  );
}

class CircleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = 50.0;

    return Center(
      child: Container(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.woolha.com/media/2019/06/buneary.jpg")))),
    );
  }
}

AnimatedContainer InfoTab(
    context, double myInfoTabWidth, double initRaduisValue) {
  return AnimatedContainer(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(initRaduisValue),
          topRight: Radius.circular(initRaduisValue)),
    ),
    width: myInfoTabWidth,
    duration: Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(child: CircleImage(), margin: EdgeInsets.all(10)),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "011157255453",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "ahln 14 pt everthimgs",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

AnimatedContainer toggleContainerWithAnime(context, double toggleMenuHight) {
  double cardsWidths = MediaQuery.of(context).size.width - 40;
  double cardHights = toggleMenuHight;
  int toggleColor = 0xFFececec;
  return AnimatedContainer(
    height: cardHights,
    duration: Duration(seconds: 3),
    curve: Curves.fastOutSlowIn,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: cardsWidths,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color(toggleColor)),
          child: Row(
            children: <Widget>[
              Container(
                  child: Icon(Icons.assignment_ind, size: 20),
                  margin: EdgeInsets.all(10)),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Track Your Account History",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Icon(Icons.arrow_forward_ios,
                      size: 14, color: Colors.green))
            ],
          ),
        ),
      ],
    ),
  );
}

AnimatedCircularChart CircularChar(double hight, double width) {
  return new AnimatedCircularChart(
    size: Size(hight, width),
    initialChartData: <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            50,
            Colors.green[400],
            rankKey: 'completed',
          ),
          new CircularSegmentEntry(
            50,
            Colors.grey[600],
            rankKey: 'remaining',
          ),
        ],
        rankKey: 'progress',
      ),
    ],
    chartType: CircularChartType.Radial,
    edgeStyle: SegmentEdgeStyle.round,
    percentageValues: true,
    holeLabel: "100" + " " + "E.P",
    labelStyle: new TextStyle(
      color: Colors.blueGrey[600],
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
}

SfRadialGauge radialChart() {
  int radialChartColor = 0xFF52935d;
  return SfRadialGauge(axes: <RadialAxis>[
    RadialAxis(
        minimum: 0,
        maximum: 80,
        showLabels: false,
        showTicks: false,
        startAngle: 270,
        endAngle: 270,
        radiusFactor: 0.7,
        axisLineStyle: AxisLineStyle(
          thickness: 0.02,
          cornerStyle: CornerStyle.endCurve,
          color: Color(radialChartColor),
          thicknessUnit: GaugeSizeUnit.factor,
        ),
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
              positionFactor: 0.1,
              angle: 100,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "0.00",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 30),
                      ),
                      Text("EGP",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20))
                    ],
                  )
                ],
              ))
        ],
        pointers: <GaugePointer>[
          RangePointer(
            value: 100,
            width: 0.17,
            color: Color(radialChartColor),
            enableDragging: true,
            pointerOffset: 0.07,
            sizeUnit: GaugeSizeUnit.factor,
          )
        ])
  ]);
}

Center circularImage(double w_size, double h_size, String image) {
  return Center(
    child: Container(
        width: w_size,
        height: h_size,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(image)))),
  );
}
