import 'package:cloud_firestore/cloud_firestore.dart';

class KategoriPengeluaran {
  final String fotoKategoriOut;
  final String namaKategoriOut;
  // final Timestamp tanggalDibuat;
  final Timestamp tanggalDibuat;

  KategoriPengeluaran({
    required this.fotoKategoriOut,
    required this.namaKategoriOut,
    required this.tanggalDibuat,
  });

  Map<String, dynamic> toJson() {
    return {
      'fotoKategoriOut': fotoKategoriOut,
      'namaKategoriOut': namaKategoriOut,
      'tanggalDibuat': tanggalDibuat,
    };
  }

  factory KategoriPengeluaran.fromJson(Map<String, dynamic> json) {
    return KategoriPengeluaran(
      fotoKategoriOut: json['fotoKategoriOut'],
      namaKategoriOut: json['namaKategoriOut'],
      tanggalDibuat: (json['tanggalDibuat']),
    );
  }
}
