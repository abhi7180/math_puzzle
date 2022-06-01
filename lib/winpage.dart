
import 'package:flutter/material.dart';
import 'package:math_puzzle/main.dart';
import 'package:math_puzzle/page1.dart';
import 'package:math_puzzle/sizedata.dart';

class winpage extends StatefulWidget {

  int? pos;
  winpage(this.pos);

  @override
  State<winpage> createState() => _winpageState();
}

class _winpageState extends State<winpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: sizedeta.height,
        width: sizedeta.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("photos/background.jpg"),
            fit: BoxFit.fill
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
                //margin: EdgeInsets.only(top: 70),
                child: Text("PUZZLE ${widget.pos!} COMPLETED",style: TextStyle(fontSize: 30),)),
            Container(
              height: sizedeta.bdheight!/2.3,
              width: sizedeta.width!-90,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("photos/trophy.png"),
                    fit: BoxFit.fill
                ),
              ),

            ),
            InkWell(
              onTap: () {

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return page1(widget.pos!);
                },));
              },
              child: Container(
                height: sizedeta.height!*0.05,
                width: sizedeta.width!/2.9,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text("CONTINUE"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return homepage();
                },));
              },
              child: Container(
                height: sizedeta.height!*0.05,
                width: sizedeta.width!/2.9,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text("MAIN MENU"),
              ),
            ),
            Container(
              height: sizedeta.height!*0.05,
              width: sizedeta.width!/2.9,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text("BUY PRO"),

            ),

            Container(
              child: Text("SHARE THIS PUZZLE",style: TextStyle(fontSize: 30),),

            ),
            Container(
              height: sizedeta.height!*0.05,
              width: sizedeta.width!/9,
              color: Colors.black,
            )
          ],
        ),

      ),
    );
  }
}
