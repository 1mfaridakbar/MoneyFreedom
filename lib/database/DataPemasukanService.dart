import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moneyfreedom/database/KategoriPemasukanService.dart';

class DataPemasukanService {
  final CollectionReference _pemasukanRef =
      FirebaseFirestore.instance.collection('dataPemasukan');

  // Menambahkan data pemasukan baru ke Firebase Firestore
  Future<void> tambahPemasukan(
    num jumlahPemasukan,
    String kategoriPemasukan,
    Timestamp tanggalPemasukan,
    String catatanPemasukan,
    String fotoUrlPemasukan,
  ) async {
    await _pemasukanRef.add({
      'jumlahPemasukan': jumlahPemasukan,
      'kategoriPemasukan': kategoriPemasukan,
      'tanggalPemasukan': tanggalPemasukan,
      'catatanPemasukan': catatanPemasukan,
      'fotoUrlPemasukan': fotoUrlPemasukan,
    });
  }

  Stream<int> get totalJumlahPemasukanStream {
    return _pemasukanRef.snapshots().map((querySnapshot) {
      int total = 0;
      for (var doc in querySnapshot.docs) {
        final data = doc.data();
        if (data is Map<String, dynamic>) {
          final jumlahPemasukan = data['jumlahPemasukan'] as int;
          total += jumlahPemasukan;
        }
      }
      return total;
    });
  }

  Stream<QuerySnapshot> dataPemasukanPerBulanStream(int bulan) {
    DateTime startDate = DateTime(DateTime.now().year, bulan, 1);
    DateTime endDate =
        DateTime(DateTime.now().year, bulan + 1, 1).subtract(Duration(days: 1));

    return _pemasukanRef
        .where('tanggalPemasukan',
            isGreaterThanOrEqualTo: Timestamp.fromDate(startDate),
            isLessThanOrEqualTo: Timestamp.fromDate(endDate))
        .orderBy('tanggalPemasukan', descending: true)
        .snapshots();
  }

  Stream<Map<String, int>> get totalJumlahPemasukanPerKategoriStream {
    return _pemasukanRef.snapshots().asyncMap((querySnapshot) async {
      Map<String, int> totalPerKategori = {};

      for (var doc in querySnapshot.docs) {
        final data = doc.data();
        if (data is Map<String, dynamic>) {
          final jumlah = data['jumlahPemasukan'] as int;
          final kategoriId = data['kategoriPemasukan'] as String;

          final namaKategori = await KategoriPemasukanService()
              .getNamaKategoriPemasukan(kategoriId);
          final kategori = namaKategori as String;

          if (totalPerKategori.containsKey(kategori)) {
            totalPerKategori[kategori] =
                (totalPerKategori[kategori] ?? 0) + jumlah;
          } else {
            totalPerKategori[kategori] = jumlah;
          }
        }
      }

      return totalPerKategori;
    });
  }

  // Mendapatkan semua data pemasukan dari Firebase Firestore
  Stream<QuerySnapshot> get dataPemasukanStream => _pemasukanRef.snapshots();

  // Menghapus data pemasukan dari Firebase Firestore
  Future<void> hapusPemasukan(String pemasukanId) async {
    await _pemasukanRef.doc(pemasukanId).delete();
  }

  // Mengupdate data pemasukan di Firebase Firestore
  Future<void> updatePemasukan(
    String pemasukanId,
    num jumlahPemasukan,
    String kategoriPemasukan,
    Timestamp tanggalPemasukan,
    String catatanPemasukan,
    String fotoUrlPemasukan,
  ) async {
    await _pemasukanRef.doc(pemasukanId).update({
      'jumlahPemasukan': jumlahPemasukan,
      'kategoriPemasukan': kategoriPemasukan,
      'tanggalPemasukan': tanggalPemasukan,
      'catatanPemasukan': catatanPemasukan,
      'fotoUrlPemasukan': fotoUrlPemasukan,
    });
  }
}
