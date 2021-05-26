import 'package:flutter/material.dart';
import 'data.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

var cardAspectratio = 12.0 / 16.0;
var widgetAspectratio = cardAspectratio * 1.2;

class _MyAppState extends State<MyApp> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF1b1e44),
            Color(0xFF2d3447),
        ],
        begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz_outlined,
                          color: Colors.white,
                          size: 37.0,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text(
                            "Animated",
                            style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "12+ Stories...",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  Scrollcard(currentPage),
                  Positioned.fill(
                      child: PageView.builder(
                          itemCount: images.length ,
                          controller: controller,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container();
                          }
                         
                          ))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Favourite",
                      style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz_outlined,
                          color: Colors.white,
                          size: 37.0,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text(
                            "Latest",
                            style: TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "4+ Stories...",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                      "assets/next.jpg",
                      width: 295.0,
                      height: 222.0,
                    )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Scrollcard extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  Scrollcard(
 this.currentPage,
  );

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectratio,
      child: LayoutBuilder(
      
        builder:
         (context, contraints) {
      
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;
        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;
        var heightOfPrimarycard = safeHeight;
        var widthOfPrimarycard = heightOfPrimarycard * cardAspectratio;
        var primaryCardLeft = safeWidth - widthOfPrimarycard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];

        for (var i = 0; i < images.length; i++) {
          var del = i - currentPage;
          bool isOnRight = del > 0;
          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -del * (isOnRight ? 15 : 1),
                  0.0);
          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-del, 0.0),
            bottom: padding + verticalInset * max(-del, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(3.0, 6.0),
                    blurRadius: 10.0,
                  )
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectratio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(
                                title[i],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Read Later",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
