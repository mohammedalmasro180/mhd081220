import 'package:animate_do/animate_do.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecm071220/constant/product_data.dart';
import 'package:ecm071220/pages/cart_page.dart';
import 'package:ecm071220/pages/product_detail_page.dart';

import 'package:ecm071220/theme/colors.dart';
import 'package:ecm071220/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map map;
  int i=1;

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
    var url = "http://dev-ishtar.96.lt/ishtar-backend/public/paintings";
    var response = await http.get(url);
    // print(response.body);
    if(response.statusCode == 200){
      map = json.decode(response.body);


      var data=map['Data'];
      setState(() {
        users = data;
        isLoading = false;
      });
    }else{
      users = [];
      isLoading = false;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: getAppBar(context),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(top: 40,left: 30,right: 30,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Ashtar",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                ),),

              ],
            ),
          ),
          Column(children: List.generate(users.length, (index){
            var text=users[index]['name'];
            var img=users[index]['image'];
            var id=users[index]['id'];
            var price=users[index]['price'];

            return FadeInDown(
              duration: Duration(milliseconds: 350 * index),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(
                      id: id,

                    )));
                  },
                  child: Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width:400,
                            decoration: BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(
                                    spreadRadius: 1,
                                    color: black.withOpacity(0.1),
                                    blurRadius: 2
                                )]
                            ),
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Container(

                                      padding: EdgeInsets.all(60),

                                      width: 280,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage(img),fit: BoxFit.cover)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text(text.toString(),style: TextStyle(
                                    fontSize:17,
                                    fontWeight: FontWeight.w600
                                ),),
                                SizedBox(height: 15,),
                                Text("\$ "+price.toString(),style: TextStyle(
                                    fontSize:16,
                                    fontWeight: FontWeight.w500
                                ),),

                                SizedBox(height: 25,)
                              ],

                            ),
                          ),
                          Positioned(
                              right: 10,
                              child: IconButton(icon: SvgPicture.asset("assets/images/heart_icon.svg"), onPressed: null))
                        ],
                      )
                  ),
                ),
              ),
            );
          })
          )
        ],
      ),
    );
  }

}