import 'package:flutter/material.dart';
import 'page_register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'page_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

//deklarasi variable
enum statusLogin{signIn, notSignIn}

class _PageLoginState extends State<PageLogin> {

  statusLogin _loginStatus = statusLogin.notSignIn;

  TextEditingController etUsername = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();


  final _keyForm = GlobalKey<FormState>();

  check() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      //print("$username, $password");
      submitLogin();
    }
  }

  String nUsername, nPassword;

  submitLogin() async{
    final responseData = await http.post("http://172.20.10.6/apps_atambua/login.php",
        body: {"username": nUsername, "password": nPassword,
        }
    );

    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
    print(data);

    //get data respon
    String dataUsername = data['username'];
    String dataEmail = data['email'];
    String dataAlamat = data['alamat'];
    String dataSex = data['sex'];
    String dataHp = data['nohp'];
    String dataFullname = data['fullname'];
    String dataCreated_at = data['created_at'];
    String dataIdUser = data['id_user'];


    //cek value 1 atau 0
    if(value == 1){
      setState(() {
        //berhasil login
//       Navigator.push(context, MaterialPageRoute(builder: (context)=> PageHome()));
      //set status login sebagai login
        _loginStatus = statusLogin.signIn;
        //simpan data login ke shared preferences
        saveDataPref(value, dataIdUser, dataUsername, dataEmail, dataAlamat, dataSex, dataHp,
            dataFullname, dataCreated_at);
      });
    }else if(value == 2){
      print(pesan);
    }else{
      print(pesan);
    }
  }

  saveDataPref(int value, String dIdUser, dUsername, dEmail, dAlamat, dSex, dHp, dFullName, dCreated) async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", value);
      sharedPreferences.setString("username", dUsername);
      sharedPreferences.setString("id_user", dIdUser);
      sharedPreferences.setString("email", dEmail);
      sharedPreferences.setString("alamat", dAlamat);
      sharedPreferences.setString("sex", dSex);
      sharedPreferences.setString("hp", dHp);
      sharedPreferences.setString("fullname", dFullName);
      sharedPreferences.setString("created", dCreated);
    });
  }

  //untuk get data preferences
  var nValue;
  getDataPref() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      nValue = sharedPreferences.getInt("value");
      _loginStatus = nValue == 1 ? statusLogin.signIn : statusLogin.notSignIn;
    });
  }

  //method untuk sign out
  signOUt() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", null);
      sharedPreferences.commit();
      _loginStatus = statusLogin.notSignIn;
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
    switch(_loginStatus){
      case statusLogin.notSignIn:
        return Scaffold(
          body: Form(
            key: _keyForm,
            child: ListView(
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
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please input username';
                      }
                      return null;
                    },
                    onSaved: (value)=> nUsername = value ,
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
                        return 'Please input Password';
                      }
                      return null;
                    },
                    onSaved: (value)=> nPassword = value ,
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
                    onPressed: (){
                      setState(() {
                        check();
                      });
                    },
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
        break;
      case statusLogin.signIn :
        return PageHome(signOUt);
        break;
    }

  }
}
