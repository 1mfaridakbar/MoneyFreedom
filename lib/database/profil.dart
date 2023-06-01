import 'package:cloud_firestore/cloud_firestore.dart';

class DataProfil {
  final String namaProfil;
  final String kodeAvatar;
  final Timestamp WaktuProfil;

  DataProfil({
    required this.namaProfil,
    required this.kodeAvatar,
    required this.WaktuProfil,
  });

  Map<String, dynamic> toJson() {
    return {
      'namaProfil': namaProfil,
      'kodeAvatar': kodeAvatar,
      'WaktuProfil': WaktuProfil,
    };
  }

  factory DataProfil.fromJson(Map<String, dynamic> json) {
    return DataProfil(
      namaProfil: json['namaProfil'],
      kodeAvatar: json['kodeAvatar'],
      WaktuProfil: json['WaktuProfil'],
    );
  }
}
