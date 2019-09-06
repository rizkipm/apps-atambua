import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Home'),
        automaticallyImplyLeading: false,//buat hilangin tombol back
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
