import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:islami_sat/main.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> doaa = ["سبحان الله", "الحمد لله", "الله اكبر"];
  int idx = 0;
  int cnt = 0;
  double degre = 30;
  double fan = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                          margin: EdgeInsets.only(left: 50),
                          height: 105,
                          width: 105,
                          child: Image.asset(
                            'assets/images/head of seb7a.png',
                            height: 105,
                            width: 105,
                          )),
                    Container(
                        margin: EdgeInsets.only(top: 80),
                        width: 234,
                        height: 183,
                        child: Transform.rotate(angle:math.pi/180*degre ,
                          child: Image.asset('assets/images/body of seb7a.png',
                              width: 234, height: 183),
                        ),
                      ),

                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
                child: Text(
              "عدد التسبيحات",
              style: TextStyle(fontSize: 25),
            ))),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Container(margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: const Color.fromARGB(255, 205, 177, 141)),
                width: 69,
                height: 81,
                child: InkWell(
                  onTap: () {
                    degre += 10;
                    fan = math.pi / 180 * degre;
                    cnt++;
                    if (cnt >= 33) {
                      cnt = 0;
                      if (idx < doaa.length - 1)
                        idx++;
                      else
                        idx = 0;
                    }
                    setState(() {});
                  },
                  child: Text(
                    "${cnt}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: const Color.fromARGB(255, 205, 177, 141)),
                width: 137,
                height: 51,
                child: Text(
                  doaa[idx],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
