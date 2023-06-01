// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class KategoriPemasukanService {
  final CollectionReference _kategori_pemasukanRef =
      FirebaseFirestore.instance.collection('KategoriPemasukan');

  // Menambahkan data Pemasukan baru ke Firebase Firestore
  Future<void> tambahKategoriPemasukan(String fotoKategoriIn,
      String namaKategoriIn, Timestamp tanggalDibuat) async {
    await _kategori_pemasukanRef.add({
      'foto': fotoKategoriIn,
      'kategori': namaKategoriIn,
      'tanggal': tanggalDibuat,
    });
  }

  Stream<QuerySnapshot> get KategoriPemasukanStream =>
      _kategori_pemasukanRef.snapshots();

  Future<Object> getNamaKategoriPemasukan(String kategoriPemasukanId) async {
    DocumentSnapshot snapshot =
        await _kategori_pemasukanRef.doc(kategoriPemasukanId).get();
    if (snapshot.exists) {
      String namaKategoriIn =
          (snapshot.data() as Map<String, dynamic>)['kategori'];
      return namaKategoriIn;
    } else {
      // Dokumen tidak ditemukan
      return Exception('Tidak Ditemukan');
    }
  }

  // Menghapus data Pemasukan dari Firebase Firestore
  Future<void> hapusKategoriPemasukan(String kategoriPemasukanId) async {
    await _kategori_pemasukanRef.doc(kategoriPemasukanId).delete();
  }
}
