
import 'dart:convert';

import 'package:ecm071220/theme/colors.dart';
import 'package:http/http.dart' as http;
import 'package:ecm071220/widgets/app_bar.dart';
import 'package:flutter/material.dart';
class profilo extends StatefulWidget {
  @override
  _profiloState createState() => _profiloState();
}

class _profiloState extends State<profilo> {
  Map map;
  int i;
  List adres;
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
    var url = "http://dev-ishtar.96.lt/ishtar-backend/public/artists";
    var response = await http.get(url);
    // print(response.body);
    if (response.statusCode == 200) {
      map = json.decode(response.body);
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Center(
          child:   GridView.builder(
    gridDelegate:
    new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),


    itemCount: users.length,
    //scrollDirection: Axis.horizontal,

    itemBuilder: (context, index) {

      var text=users[index]['name'];
      var img=users[index]['path'];


      return Padding(padding: EdgeInsets.all(10),
    child:   Container(
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
        Padding(padding: EdgeInsets.all(40),
          child: Container(
            width: 150.0,
            height: 150.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                      img

                    )
                )
        ),

          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15),
          child:Text(text.toString(),),
        )
      ],
    ),
    ),

      );
    }
    ),
      ),
    );

  }
}
