import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecm071220/theme/colors.dart';
import 'package:ecm071220/widgets/product_slider.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;





  const ProductDetailPage({Key key, this.id}) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Map map;
  int i = 1;
  var price;
  var width;
  var hiegth;
   var story;
   var artist;
  var name;
  var img;
  List users = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://dev-ishtar.96.lt/ishtar-backend/public/painting/${widget.id}";
    var response = await http.get(url);
    // print(response.body);
      map = json.decode(response.body);
      //List<dynamic> data = ;
    print(map["Data"]["price"]);
    setState(() {
      name= map["Data"]["name"];
      price= map["Data"]["price"];
      img= map["Data"]["image"];
      artist= map["Data"]["artist"];
      hiegth= map["Data"]["height"];
      width= map["Data"]["height"];
      story= map["Data"]["story"];
      isLoading = false;
    });





  }

    @override
    Widget build(BuildContext context) {
      //String url=users[2]['image'];


      return Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      blurRadius: 2,
                      color: black.withOpacity(0.1),
                      spreadRadius: 1,
                    )
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: grey

                ),
                child: Stack(
                  children: <Widget>[

                    SafeArea(
                      child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: black,),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    )

                  ],
                ),
              ),
              SizedBox(height: 30,),
              FadeInDown(
                delay: Duration(
                    milliseconds: 350
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Center(

                    child: Container(
                      width: 280,
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(img.toString()),fit: BoxFit.cover)
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),
              FadeInDown(
                delay: Duration(
                    milliseconds: 350
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Text(name.toString(),
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        height: 1.5
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: FadeInDown(
                  delay: Duration(
                      milliseconds: 400
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text("\$"+price.toString(), style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        height: 1.5
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              SizedBox(height: 25,),
              FadeInDown(
                delay: Duration(
                    milliseconds: 400
                ),
              ),
              SizedBox(height: 25,),
              Container(
                alignment: FractionalOffset.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[

                    Padding(padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Icon((Icons.favorite)),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Icon((Icons.shopping_cart)),
                    ),
                  ],

                ),
              ),
              Row(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text("Height",

                        style: TextStyle(
                            fontSize: 20,

                            height: 1.5
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text(hiegth.toString(),

                        style: TextStyle(
                            color: Colors.lime,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.5
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text("Width ",

                        style: TextStyle(
                            fontSize: 20,

                            height: 1.5
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text(width.toString(),

                        style: TextStyle(
                            color: Colors.lime,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.5
                        ),
                      ),
                    ),

                  ]
              ),
              Divider(height: 60, color: Colors.black,),
              Row(
                  children: <Widget>[


                    Padding(padding: const EdgeInsets.all(10),
                      child: Text("Story",

                        style: TextStyle(
                            fontSize: 20,

                            height: 1.5
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text(story.toString(),

                        style: TextStyle(
                            color: Colors.lime,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.5
                        ),
                      ),
                    ),

                  ]
              ),


              Divider(height: 60, color: Colors.black,),
              Row(
                  children: <Widget>[


                    Padding(padding: const EdgeInsets.all(10),
                      child: Text("Artist",

                        style: TextStyle(
                            fontSize: 20,

                            height: 1.5
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text(artist.toString(),

                        style: TextStyle(
                            color: Colors.lime,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.5
                        ),
                      ),
                    ),

                  ]
              ),


              SizedBox(height: 50,),

              SizedBox(height: 70,),
            ],
          ),
        ),
      );
    }
  }