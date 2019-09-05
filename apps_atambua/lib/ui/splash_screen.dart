import 'dart:async';
import 'package:flutter/material.dart';

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
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/exodus.gif'),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
