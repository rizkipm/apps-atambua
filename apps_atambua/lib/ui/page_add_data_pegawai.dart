import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PageAddPegawai extends StatefulWidget {
  @override
  _PageAddPegawaiState createState() => _PageAddPegawaiState();
}

class _PageAddPegawaiState extends State<PageAddPegawai> {




  //deklarasi untuk string  masing2 widget
  String nip, nama_pegawai, pangkat, golongan, jabatan, tempat_tugas, hak_akses;
  //tambahkan key form
  final _keyForm = GlobalKey<FormState>();

  check() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      //print("$username, $password");
      submitDataRegister();
    }
  }

  String idUser = "", username = "", fullname = "";

  getDataPref() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {

      idUser = sharedPreferences.getString("id_user");
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
  submitDataRegister() async{
    final responseData = await http.post("http://172.20.10.6/apps_atambua/add_pegawai.php",
        body: {"nip" : nip, "nama_pegawai": nama_pegawai, "pangkat": pangkat, "golongan": golongan,
          "jabatan" : jabatan, "tempat_tugas": tempat_tugas, "hak_akses":hak_akses, "created_by": idUser

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
    }else if(value == 2){
      print(pesan);
    }else{
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data Pegawai'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Form(
        key: _keyForm,
        child: ListView(
          children: <Widget>[

            SizedBox(height: 35,),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
              child: TextFormField(
                //text field harus di isi
                //cek data kosong
                validator: (value){
                  if(value.isEmpty){
                    return 'Please input NIP Pegawai';
                  }
                  return null;
                },
                onSaved: (value)=> nip = value ,

                decoration: InputDecoration(
                    hintText: 'NIP Pegawai',
                    labelText: 'Input NIP',
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
                    return 'Please input Nama Pegawai';
                  }
                  return null;
                },
                onSaved: (value)=> nama_pegawai = value ,

                decoration: InputDecoration(
                    hintText: 'Nama Pegawai',
                    labelText: 'Input Nama Pegawai',
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
                    return 'Please input Pangkat';
                  }
                  return null;
                },
                onSaved: (value)=> pangkat = value ,
                decoration: InputDecoration(
                    hintText: 'Pangkat',
                    labelText: 'Input Pangkat',
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
                    return 'Please input Golongan';
                  }
                  return null;
                },
                onSaved: (value)=> golongan = value ,
                decoration: InputDecoration(
                    hintText: 'Golongan',
                    labelText: 'Input Golongan',
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
                    return 'Please Jabatan';
                  }
                  return null;
                },
                onSaved: (value)=> jabatan = value ,

                decoration: InputDecoration(
                    hintText: 'Jabatan',

                    labelText: 'Jabatan',
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
                    return 'Please input Tempat Tugas';
                  }
                  return null;
                },
                onSaved: (value)=> tempat_tugas = value ,
                maxLines: 3,
                decoration: InputDecoration(

                    hintText: 'Tempat Tugas',
                    labelText: 'Input Tempat Tugas',
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
                    return 'Please Input Hak Akses';
                  }
                  return null;
                },
                onSaved: (value)=> hak_akses = value ,

                decoration: InputDecoration(
                    hintText: 'Hak Akses',

                    labelText: 'Hak Akses',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),

            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 20),
              child: MaterialButton(
                color: Colors.blueGrey,
                textColor: Colors.white,
                child: Text('Submit Register'),
                onPressed: (){
                  setState(() {
                    check();
//
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
