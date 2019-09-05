import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35.0),
        child: ListView(
          children: <Widget>[

            Image.asset('assets/bea_cukai.png', height: 100.0, width: 100.0,),
            SizedBox(height: 10.0,),
            Text('Register Form', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,
                color: Colors.blueGrey
            ),textAlign: TextAlign.center,),

            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
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
                controller: etUsername,
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
