import 'package:flutter/material.dart';
import 'page_register.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  TextEditingController etUsername = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();

//  String sex = "";
//
//  void _pilihSex(String value){
//    setState(() {
//      sex = value;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35.0),
        child: Column(
          children: <Widget>[
            Text('Login Form', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,
              color: Colors.blueGrey
            ),),
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
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: etPassword,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',

                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0),
              child: MaterialButton(
                color: Colors.blueGrey,
                textColor: Colors.white,
                child: Text('Login'),
                onPressed: (){},
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
              child: MaterialButton(
                textColor: Colors.blueGrey,
                child: Text('Belum Punya Akun? Silahkan Register'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PageRegister()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
