import 'dart:async';
import 'package:flutter/material.dart';
import 'page_login.dart';

class PageSplashScreen extends StatefulWidget {
  @override
  _PageSplashScreenState createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {

  Future<Timer> loadData() async{
    return new Timer(Duration(seconds: 5),onDoneLoading);
  }

  onDoneLoading()async{
    //setelah splash akan pindah ke page selanjutnya
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>PageLogin()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/dance.gif'),
//      decoration: BoxDecoration(
//        image: DecorationImage(
//          image: AssetImage('assets/exodus.gif'),
//          fit: BoxFit.cover
//        )
//      ),
    );
  }
}
