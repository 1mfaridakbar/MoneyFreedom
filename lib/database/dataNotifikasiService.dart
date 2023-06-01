import 'package:cloud_firestore/cloud_firestore.dart';

class DataNotifikasiService {
  final CollectionReference _data_notifikasiRef =
      FirebaseFirestore.instance.collection('DataNotifikasi');

  Future<void> tambahDataNotifikasi(
      String jamNotifikasi, String pesanNotifikasi) async {
    await _data_notifikasiRef.add({
      'jamNotifikasi': jamNotifikasi,
      'pesanNotifikasi': pesanNotifikasi,
    });
  }

  Stream<QuerySnapshot> get dataNotifikasiStream =>
      _data_notifikasiRef.snapshots();

  Future<Object> getPesanNotifikasi(String dataNotifikasiId) async {
    DocumentSnapshot snapshot =
        await _data_notifikasiRef.doc(dataNotifikasiId).get();
    if (snapshot.exists) {
      String pesanNotifikasi =
          (snapshot.data() as Map<String, dynamic>)['pesanNotifikasi'];
      return pesanNotifikasi;
    } else {
      return Exception('Tidak Ditemukan');
    }
  }

  Future<void> hapusDataNotifikasi(String dataNotifikasiId) async {
    await _data_notifikasiRef.doc(dataNotifikasiId).delete();
  }

  Future<void> updateDataNotifikasi(String dataNotifikasiId,
      String jamNotifikasi, String pesanNotifikasi) async {
    await _data_notifikasiRef.doc(dataNotifikasiId).update({
      'jamNotifikasi': jamNotifikasi,
      'pesanNotifikasi': pesanNotifikasi,
    });
  }
}
