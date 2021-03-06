import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'page_add_data_pegawai.dart';
import 'package:apps_atambua/model/model_list_pegawai.dart';
import 'package:http/http.dart' as http;

class PageHome extends StatefulWidget {

  final VoidCallback signOut;
  PageHome(this.signOut);


  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {


  List<ModelListPegawai> listPegawai = [];

  var loading = false;

  //proses get data on background
  Future<Null> getData() async{

    setState(() {
      loading = true; //ketika proses get data set loading nya true
    });

    final responseData = await http.get("http://172.20.10.6/apps_atambua/get_list_pegawai.php");
    //cek status response
    if(responseData.statusCode ==200){
      final data = jsonDecode(responseData.body);
      setState(() {
        for (Map i in data){
          //menambahkan data yang sudah berhasil di get ke list model
          listPegawai.add(ModelListPegawai.fromJson(i));
        }

        //proses get data berhasil , loading di set false
        loading = false;
      });
    }
  }

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
    getData();
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

      body: Container(
        child: loading ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: listPegawai.length,
          itemBuilder: (context, index){
            final nDataList = listPegawai[index];
            return Card(
              margin: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(nDataList.namaPegawai, style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16.0, color: Colors.red
                  ),),

                  Text(nDataList.jabatan)
                ],
              ),
            );
          },
        ),) ,


      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Navigator.push(context, MaterialPageRoute(builder: (context)=>PageAddPegawai()));
        },child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        shape: _DiamondBorder(),
      ),
    );
  }
}

class _DiamondBorder extends ShapeBorder {
  const _DiamondBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, { TextDirection textDirection }) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, { TextDirection textDirection }) {
    return Path()
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width  / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, { TextDirection textDirection }) {}

  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
