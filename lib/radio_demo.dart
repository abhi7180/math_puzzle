
import 'package:flutter/material.dart';

class radio_demo extends StatefulWidget {
  const radio_demo({Key? key}) : super(key: key);

  @override
  State<radio_demo> createState() => _radio_demoState();
}

class _radio_demoState extends State<radio_demo> {
  bool pizza = false;
  bool burgar = false;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(value: pizza, onChanged: (value) {
                setState(() {
                  pizza = value!;
                });
              },),
              Text("Pizza")
            ],
          ),
          Row(
            children: [
              Checkbox(value: burgar, onChanged: (value) {
                setState(() {
                  burgar = value!;
                });
              },),
              Text("Pizza")
            ],
          ),
          CheckboxListTile(title: Text("Pizza"),subtitle: Text("100"),value: pizza, onChanged: (value) {
            setState(() {
              pizza = value!;
              if(pizza){
                total = total +  100;
              }else {
                total = total -  100;
              }
            });
          },),
          CheckboxListTile(title: Text("Burgar"),subtitle: Text("50"),value: burgar, onChanged: (value) {
            setState(() {
              burgar = value!;
              if(burgar)
                {
                  total = total + 50;
                }else {
                total = total -  50;
              }
            });
          },),
          Text("Total : $total")
        ],
      ),
    );
  }
}
