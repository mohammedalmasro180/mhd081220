import 'package:ecm071220/pages/proflio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecm071220/pages/cart_page.dart';
import 'package:ecm071220/pages/menu_page.dart';
import 'package:ecm071220/theme/colors.dart';

Widget getAppBar(context){
    return AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: SvgPicture.asset("assets/images/burger_icon.svg"),onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => MenuPage()));
        }),
            InkWell(onTap: (){},
              child: Text("data",style: TextStyle(fontSize: 22),),),
            Row(
              children: <Widget>[

          IconButton(icon: Container(
            width:100 ,
            child: Center(
              child: Text("Astries",style: TextStyle(

                color: white,
                fontSize: 13,
                fontWeight: FontWeight.w600
              ),),
            ),
            decoration: BoxDecoration(
              color: black,
              shape: BoxShape.rectangle
            ),
          ), onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => profilo()));
          }),
              ],
            )
          ],
        ),
      );
  }