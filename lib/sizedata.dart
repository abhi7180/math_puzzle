import 'package:flutter/material.dart';

class sizedeta
{
  static double? width,height,stheight,btheight,appheight,bdheight;
  sizedeta(BuildContext context)
  {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    stheight=MediaQuery.of(context).padding.top;
    btheight=MediaQuery.of(context).padding.bottom;
    appheight=kToolbarHeight;
    bdheight=height!-stheight!-btheight!-appheight!;


  }


}