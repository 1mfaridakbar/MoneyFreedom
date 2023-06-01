import 'package:cloud_firestore/cloud_firestore.dart';

class DataPemasukan {
  final String catatanPemasukan;
  final String fotoUrlPemasukan;
  final String kategoriPemasukan;
  final num jumlahPemasukan;
  final Timestamp tanggalPemasukan;

  DataPemasukan({
    required this.catatanPemasukan,
    required this.fotoUrlPemasukan,
    required this.kategoriPemasukan,
    required this.jumlahPemasukan,
    required this.tanggalPemasukan,
  });

  Map<String, dynamic> toJson() {
    return {
      'catatanPemasukan': catatanPemasukan,
      'fotoUrlPemasukan': fotoUrlPemasukan,
      'kategoriPemasukan': kategoriPemasukan,
      'jumlahPemasukan': jumlahPemasukan,
      'tanggalPemasukan': tanggalPemasukan,
    };
  }

  factory DataPemasukan.fromJson(Map<String, dynamic> json) {
    return DataPemasukan(
      catatanPemasukan: json['catatanPemasukan'],
      fotoUrlPemasukan: json['fotoUrlPemasukan'],
      kategoriPemasukan: json['kategoriPemasukan'],
      jumlahPemasukan: json['jumlahPemasukan'],
      tanggalPemasukan: (json['tanggalPemasukan']),
    );
  }
}
