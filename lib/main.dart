
import 'package:flutter/material.dart';
import 'package:math_puzzle/page1.dart';
import 'package:math_puzzle/page2.dart';
import 'package:math_puzzle/radio_demo.dart';
import 'package:math_puzzle/sizedata.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: radio_demo(),
  ));
}
class homepage extends StatefulWidget {

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  int lastlevel=0;
  bool getdata=false;

  SharedPreferences? prefs;
  memory() async {
    prefs = await SharedPreferences.getInstance();
    lastlevel = await prefs!.getInt('lastlevel') ?? 0;
    print("lastlevel=$lastlevel");
    setState(() {
      getdata=true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    memory();
  }
  @override
  Widget build(BuildContext context) {
    sizedeta(context);
    print(sizedeta.bdheight);
    print(sizedeta.height);
    return Scaffold(
      body: getdata ? Container(
        height: sizedeta.height,
        width: sizedeta.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("photos/background.jpg"),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70),
              child: Text("Math Puzzles",style: TextStyle(fontSize: 40),),

            ),
            Container(
              height: sizedeta.bdheight!/1.5,
              width: sizedeta.width!-30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("photos/main_board.png"),
                    fit: BoxFit.fill
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return page1(lastlevel);
                      },));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("Continue",style: TextStyle(fontSize: 30,color: Colors.white),),),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return page2();
                      },));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("Puzzles",style: TextStyle(fontSize: 30,color: Colors.white),),),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("Buy pro",style: TextStyle(fontSize: 30,color: Colors.white),),),
                  ),
                ],
              ),
            ),
          ],
        ),

      ) : Container(),
    );
  }
}

