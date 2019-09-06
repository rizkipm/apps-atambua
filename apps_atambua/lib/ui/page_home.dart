import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PageHome extends StatefulWidget {

  final VoidCallback signOut;
  PageHome(this.signOut);


  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  //tambahan method signout
  signOut() async{
    setState(() {
      widget.signOut();
    });
  }

  //mengambil nilai dari shared preferences

  String username = "", fullname = "";

  getDataPref() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString("username");
      fullname = sharedPreferences.getString("fullname");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataPref();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ' + username),
        automaticallyImplyLeading: false,//buat hilangin tombol back
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: (){
              signOut();
            },
          )
        ],
      ),
    );
  }
}
