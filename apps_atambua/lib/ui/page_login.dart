import 'package:flutter/material.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  TextEditingController etUsername = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();

  String sex = "";

  void _pilihSex(String value){
    setState(() {
      sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35.0),
        child: Column(
          children: <Widget>[
            Text('Register Form'),
            SizedBox(height: 20.0,),
            Image.asset('assets/bea_cukai.png', height: 100.0, width: 100.0,),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: etUsername,
                decoration: InputDecoration(
                  hintText: 'Username',
                  labelText: 'Input Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
