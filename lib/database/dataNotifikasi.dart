import 'package:cloud_firestore/cloud_firestore.dart';

class DataNotifikasi {
  final String jamNotifikasi;
  final String pesanNotifikasi;
  // Tambahkan atribut lainnya yang diperlukan

  DataNotifikasi({
    required this.jamNotifikasi,
    required this.pesanNotifikasi,
    // Inisialisasi atribut lainnya
  });

  Map<String, dynamic> toJson() {
    return {
      'jamNotifikasi': jamNotifikasi,
      'pesanNotifikasi': pesanNotifikasi,
      // Tambahkan atribut lainnya ke dalam map
    };
  }

  factory DataNotifikasi.fromJson(Map<String, dynamic> json) {
    return DataNotifikasi(
      jamNotifikasi: json['jamNotifikasi'],
      pesanNotifikasi: json['pesanNotifikasi'],
      // Inisialisasi atribut lainnya dari map
    );
  }
}
