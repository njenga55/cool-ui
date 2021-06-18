import 'dart:ffi';

import 'package:cool_ui_test/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: WelcomePage()),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: textColor,
              size: 30.0,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: textColor,
            iconSize: 30.0,
          )
        ],
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
      child: Column(
        children: [
          UserDetails(),
          CategoryScroll(),
          Container(
            height: 300.0,
            width: double.infinity,
            child: ImageListView(),
          ),
          SizedBox(
            height: 10.0,
          ),
          BottomContainer(),
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  Widget drawCircleHere(context) {
    const TWO_PI = 3.14 * 2;
    final size = 100.0;
    return Container(
      height: 100,
      width: 100,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return SweepGradient(
                      startAngle: 0.0,
                      endAngle: TWO_PI,
                      stops: [0.6, 0.1],
                      // 0.0 , 0.5 , 0.5 , 1.0
                      center: Alignment.center,
                      colors: [Colors.red, Colors.grey.withAlpha(55)])
                  .createShader(rect);
            },
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                // image: DecorationImage(
                //     image:
                //         Image.asset("assets/images/radial_scale.png").image)
              ),
            ),
          ),
          Center(
            child: Container(
              width: size - 20,
              height: size - 20,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Center(
                  child: Text(
                "62%",
                style: TextStyle(fontSize: 40),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Expanded(
          child: Stack(
        children: [
          Positioned(
            bottom: 4,
            right: 0,
            child: Container(
              color: Colors.black45,
              height: 100.0,
              width: 100.0,
              child: RotatedBox(
                quarterTurns: 1,
                child: Center(
                    child: Text(
                  "Comments",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 205,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Progress",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      letterSpacing: 0.25),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          drawCircleHere(context),
                          SizedBox(
                            width: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'English',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                'Language',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                    letterSpacing: 0.25),
                              ),
                              Text(
                                '7/70 lessons',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class ImageListView extends StatefulWidget {
  @override
  _ImageListView createState() => _ImageListView();
}

class _ImageListView extends State<ImageListView> {
  List<Map> sliderData = <Map>[
    {'image': 'image', 'desc': 'Description comes here'},
    {'image': 'image', 'desc': 'Description comes here'},
    {'image': 'image', 'desc': 'Description comes here'},
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sliderData.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
              child: Container(
                height: size.width * 0.5,
                width: size.width * 0.5,
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/surfing.jpg',
                        width: double.infinity,
                        height: 200,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Light Dispsersion',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      Text('5 lessons'),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class CategoryScroll extends StatefulWidget {
  @override
  _CategoryScroll createState() => _CategoryScroll();
}

class _CategoryScroll extends State<CategoryScroll> {
  List<String> categories = ['Physics', 'Biology', 'Chemistry', 'Mathematics'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Container(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Samantha",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.25),
            )
          ],
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(
            'assets/images/user.jpeg',
          ),
        ),
      ],
    );
  }
}
