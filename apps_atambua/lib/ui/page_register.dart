import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageRegister extends StatefulWidget {
  @override
  _PageRegisterState createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {

  TextEditingController etUsername = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();
  TextEditingController etFullname = new TextEditingController();
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etAlamat = new TextEditingController();
  TextEditingController etNohp = new TextEditingController();

  String sex = "";

  void _pilihSex(String value){
    setState(() {
      sex = value;
    });
  }

  //deklarasi untuk string  masing2 widget
  String nUsername, nFullname, nEmail, nPassword, nAlamat, nNohp;
  //tambahkan key form
  final _keyForm = GlobalKey<FormState>();

  submitDataRegister() async{
    final responseData = await http.post("http://172.20.10.6/apps_atambua/register.php",
      body: {"fullname" : nFullname, "username": nUsername, "email": nEmail, "password": nPassword,
        "nohp" : nNohp, "sex": sex, "alamat":nAlamat

      }
    );

    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];

    //cek value 1 atau 0
    if(value == 1){
      setState(() {
        Navigator.pop(context);
      });
    }else{
      print(pesan);
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _keyForm,
        child: ListView(
          children: <Widget>[

            SizedBox(height: 35,),

            Image.asset('assets/bea_cukai.png', height: 100.0, width: 100.0,),
            SizedBox(height: 10.0,),
            Text('Register Form', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,
                color: Colors.blueGrey
            ),textAlign: TextAlign.center,),

            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
              child: TextFormField(
                //text field harus di isi
                //cek data kosong
                validator: (value){
                  if(value.isEmpty){
                    return 'Please input username';
                  }
                  return null;
                },
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
                validator: (value){
                  if(value.isEmpty){
                    return 'Please input Full name';
                  }
                  return null;
                },
                controller: etFullname,
                decoration: InputDecoration(
                    hintText: 'Full Name',
                    labelText: 'Input Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return 'Please input Email';
                  }
                  return null;
                },
                controller: etEmail,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Input Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return 'Please input No Hp';
                  }
                  return null;
                },
                controller: etNohp,
                decoration: InputDecoration(
                    hintText: 'No Hp',
                    labelText: 'Input No Hp',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return 'Please input Password';
                  }
                  return null;
                },
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
              padding: EdgeInsets.all(10.0),
              child: RadioListTile(
                value: "Laki-laki",
                title: Text('Laki - laki'),
                groupValue: sex,
                onChanged: (String value){
                  _pilihSex(value);
                },
                activeColor: Colors.blueGrey,
                subtitle: Text(
                  'Pilih ini jika anda laki - laki'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RadioListTile(
                value: "Perempuan",
                title: Text('Perempuan'),
                groupValue: sex,
                onChanged: (String value){
                  _pilihSex(value);
                },
                activeColor: Colors.blueGrey,
                subtitle: Text(
                    'Pilih ini jika anda Perempuan'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return 'Please input Alamat';
                  }
                  return null;
                },
                controller: etAlamat,
                maxLines: 3,
                decoration: InputDecoration(

                    hintText: 'Alamat',
                    labelText: 'Input Alamat',
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
                child: Text('Sudah Punya Akun ? Silahkan Login'),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
