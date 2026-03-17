import 'package:flutter/material.dart';

class s1 extends StatelessWidget {
  s1({super.key});
  List<Widget> boxList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.5,
            decoration: BoxDecoration(color: Color(0xffBBDEFA)),

            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Box(text: 'A', color: Color(0xffEE534F)),
                    Box(text: 'B', color: Color(0xffFFA827)),
                    Box(text: 'C', color: Color(0xffFDD734)),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  decoration: BoxDecoration(color: Color(0xffC5CAE8)),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      Text(
                        'Fancy Section',
                        style: TextStyle(
                          color: Color(0xff474DAE),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: .center,
                        children: [
                          Box(
                            text: '1',
                            color: Color(0xff7E57C2),
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 8),
                          Box(
                            text: '2',
                            color: Color(0xffAA47BC),
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 8),
                          Box(
                            text: '3',
                            color: Color(0xff9675CE),
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: .center,
                        children: [
                          Box(
                            text: '4',
                            color: Color(0xffB968C7),
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 8),
                          Box(
                            text: '5',
                            color: Color(0xffB39DDB),
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 8),
                          Box(
                            text: '6',
                            color: Color(0xffCF93D9),
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  'Info Cards',
                  style: TextStyle(
                    color: Color(0xff474DAE),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    BoxDoubleTxt(
                      number: '23',
                      color: Color(0xff2DA296),
                      text: 'Active',
                    ),
                    SizedBox(width: 16),
                    BoxDoubleTxt(
                      number: '15',
                      color: Color(0xffF8B11A),
                      text: 'Pinding',
                    ),
                    SizedBox(width: 16),
                    BoxDoubleTxt(
                      number: '7',
                      color: Color(0xff459E4A),
                      text: 'Completed',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  String text;
  Color color;
  double width;
  double height;

  Box({
    this.width = 70,
    this.height = 40,
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BoxDoubleTxt extends StatelessWidget {
  String number;
  String text;
  Color color;

  BoxDoubleTxt({
    required this.number,
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
