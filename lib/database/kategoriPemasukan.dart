import 'package:cloud_firestore/cloud_firestore.dart';

class kategoriPemasukan {
  final String fotoKategoriIn;
  final String namaKategoriIn;
  final Timestamp tanggalDibuat;

  kategoriPemasukan({
    required this.fotoKategoriIn,
    required this.namaKategoriIn,
    required this.tanggalDibuat,
  });

  Map<String, dynamic> toJson() {
    return {
      'fotoKategoriIn': fotoKategoriIn,
      'namaKategoriIn': namaKategoriIn,
      'tanggalDibuat': tanggalDibuat,
    };
  }

  factory kategoriPemasukan.fromJson(Map<String, dynamic> json) {
    return kategoriPemasukan(
      fotoKategoriIn: json['fotoKategoriIn'],
      namaKategoriIn: json['namaKategoriIn'],
      tanggalDibuat: (json['tanggalDibuat']),
    );
  }
}
