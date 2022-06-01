import 'package:flutter/material.dart';
import 'package:math_puzzle/page1.dart';
import 'package:math_puzzle/sizedata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class page2 extends StatefulWidget {

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {

  SharedPreferences? prefs;
  List levelstatus=[];
  bool getdata=false;
  int? lastlevel;
  memory() async {
    prefs = await SharedPreferences.getInstance();
    lastlevel = prefs!.getInt('lastlevel') ?? 0;
    print("lastlevel=$lastlevel");
    setState(() {
      for(int i=0;i<20;i++)
        {
          String? status = prefs!.getString('level$i');
          print("level$i=$status");
          levelstatus.add(status);
        }
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
    return Scaffold(
      body: getdata?
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4),
        itemCount: 20,
        itemBuilder: (context, index) {

          if(index==lastlevel! )
            {
              return InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return page1(index);
                  },));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("${index+1}"),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),

                  ),

                ),
              );
            }
          if(levelstatus[index]=="win")
          {
            return InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return page1(index);
                },));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text("${index+1}"),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(
                        image: AssetImage("photos/tick.png")
                    )
                ),

              ),
            );
          }
          if(levelstatus[index]=="skip")
          {
            return InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return page1(index);
                },));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text("${index+1}"),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),

                ),

              ),
            );
          }
          else
          {
            return Container(
              // child: Text("$index"),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("photos/lock.png")
                  )
              ),
            );
          }

        },):Container()
    );
  }
}
