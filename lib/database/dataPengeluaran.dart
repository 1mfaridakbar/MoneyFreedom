import 'package:cloud_firestore/cloud_firestore.dart';

class DataPengeluaran {
  final String catatan;
  final String foto;
  final String kategori;
  final num jumlah;
  final Timestamp tanggal;

  DataPengeluaran({
    required this.catatan,
    required this.foto,
    required this.kategori,
    required this.jumlah,
    required this.tanggal,
  });

  Map<String, dynamic> toJson() {
    return {
      'catatan': catatan,
      'foto': foto,
      'kategori': kategori,
      'jumlah': jumlah,
      'tanggal': tanggal,
    };
  }

  factory DataPengeluaran.fromJson(Map<String, dynamic> json) {
    return DataPengeluaran(
      catatan: json['catatan'],
      foto: json['foto'],
      kategori: json['kategori'],
      jumlah: json['jumlah'],
      tanggal: (json['tanggal']),
    );
  }
}
