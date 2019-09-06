// To parse this JSON data, do
//
//     final modelListPegawai = modelListPegawaiFromJson(jsonString);

import 'dart:convert';

List<ModelListPegawai> modelListPegawaiFromJson(String str) => new List<ModelListPegawai>.from(json.decode(str).map((x) => ModelListPegawai.fromJson(x)));

String modelListPegawaiToJson(List<ModelListPegawai> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ModelListPegawai {
  String idPegawai;
  String nip;
  String namaPegawai;
  String pangkat;
  String golongan;
  String jabatan;
  String tempatTugas;
  String hakAkses;
  String createdBy;
  DateTime createdAt;
  String idUser;
  String username;
  String fullname;
  String email;
  String password;
  String alamat;
  String sex;
  String nohp;

  ModelListPegawai({
    this.idPegawai,
    this.nip,
    this.namaPegawai,
    this.pangkat,
    this.golongan,
    this.jabatan,
    this.tempatTugas,
    this.hakAkses,
    this.createdBy,
    this.createdAt,
    this.idUser,
    this.username,
    this.fullname,
    this.email,
    this.password,
    this.alamat,
    this.sex,
    this.nohp,
  });

  factory ModelListPegawai.fromJson(Map<String, dynamic> json) => new ModelListPegawai(
    idPegawai: json["id_pegawai"],
    nip: json["nip"],
    namaPegawai: json["nama_pegawai"],
    pangkat: json["pangkat"],
    golongan: json["golongan"],
    jabatan: json["jabatan"],
    tempatTugas: json["tempat_tugas"],
    hakAkses: json["hak_akses"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    idUser: json["id_user"],
    username: json["username"],
    fullname: json["fullname"],
    email: json["email"],
    password: json["password"],
    alamat: json["alamat"],
    sex: json["sex"],
    nohp: json["nohp"],
  );

  Map<String, dynamic> toJson() => {
    "id_pegawai": idPegawai,
    "nip": nip,
    "nama_pegawai": namaPegawai,
    "pangkat": pangkat,
    "golongan": golongan,
    "jabatan": jabatan,
    "tempat_tugas": tempatTugas,
    "hak_akses": hakAkses,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "id_user": idUser,
    "username": username,
    "fullname": fullname,
    "email": email,
    "password": password,
    "alamat": alamat,
    "sex": sex,
    "nohp": nohp,
  };
}
