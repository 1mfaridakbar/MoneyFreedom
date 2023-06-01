// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class KategoriPengeluaranService {
  final CollectionReference _kategori_pengeluaranRef =
      FirebaseFirestore.instance.collection('KategoriPengeluaran');

  // Menambahkan data pengeluaran baru ke Firebase Firestore
  Future<void> tambahKategoriPengeluaran(String fotoKategoriOut,
      String namaKategoriOut, Timestamp tanggalDibuat) async {
    await _kategori_pengeluaranRef.add({
      'foto': fotoKategoriOut,
      'kategori': namaKategoriOut,
      'tanggal': tanggalDibuat,
    });
  }

  // Mendapatkan semua data pengeluaran dari Firebase Firestore
  Stream<QuerySnapshot> get KategoriPengeluaranStream =>
      _kategori_pengeluaranRef.snapshots();

  Future<Object> getNamaKategoriPengeluaran(
      String KategoriPengeluaranId) async {
    DocumentSnapshot snapshot =
        await _kategori_pengeluaranRef.doc(KategoriPengeluaranId).get();
    if (snapshot.exists) {
      String namaKategoriOut =
          (snapshot.data() as Map<String, dynamic>)['kategori'];
      return namaKategoriOut;
    } else {
      // Dokumen tidak ditemukan
      return Exception('Tidak Ditemukan');
    }
  }

  // Menghapus data pengeluaran dari Firebase Firestore
  Future<void> hapusKategoriPengeluaran(String KategoriPengeluaranId) async {
    await _kategori_pengeluaranRef.doc(KategoriPengeluaranId).delete();
  }

  // Mengupdate data pengeluaran di Firebase Firestore
  Future<void> updateKategoriPengeluaran(
      String KategoriPengeluaranId,
      String fotoKategoriOut,
      String namaKategoriOut,
      Timestamp tanggalDibuat) async {
    await _kategori_pengeluaranRef.doc(KategoriPengeluaranId).update({
      'foto': fotoKategoriOut,
      'kategori': namaKategoriOut,
      'tanggal': tanggalDibuat,
    });
  }
}
