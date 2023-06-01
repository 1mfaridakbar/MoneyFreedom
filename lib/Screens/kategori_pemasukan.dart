import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moneyfreedom/database/KategoriPemasukanService.dart';
import 'create_transaction_pemasukan.dart';
import 'create_transaction_pemasukan.dart';

class kategori_pemasukan extends StatefulWidget {
  const kategori_pemasukan({Key? key}) : super(key: key);

  @override
  State<kategori_pemasukan> createState() => _kategori_pemasukanState();
}

class _kategori_pemasukanState extends State<kategori_pemasukan> {
  final CollectionReference _kategoriPemasukan =
      FirebaseFirestore.instance.collection('kategoriPemasukan');
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController _pemasukanController = TextEditingController();

  void _saveKategoriPemasukan() async {
    // Mengambil inputan dari form
    String fotoUrl = "";
    String kategori = _pemasukanController.text;
    DateTime dateTime = DateTime.now();
    Timestamp tanggal = Timestamp.fromDate(dateTime);

    // Membuat objek data pemasukan
    Map<String, dynamic> data = {
      "fotoUrl": fotoUrl,
      "kategori": kategori,
      "tanggal": dateTime,
    };

    // Menyimpan data ke Firestore
    await _kategoriPemasukanService.tambahKategoriPemasukan(
        fotoUrl, kategori, tanggal);
  }

  final KategoriPemasukanService _kategoriPemasukanService =
      KategoriPemasukanService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Kategori'),
        leading: BackButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateTransactionPemasukan())),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              openDialog();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
          stream: KategoriPemasukanService().KategoriPemasukanStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Terjadi kesalahan saat memuat data');
            }

            if (!snapshot.hasData) {
              return const Text('Belum ada data pemasukan');
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final kategoriPemasukan = snapshot.data!.docs[index];

                return Card(
                  elevation: 10,
                  child: ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await _kategoriPemasukanService
                                  .hapusKategoriPemasukan(kategoriPemasukan
                                      .id); // menghapus data dari Firestore
                              setState(
                                  () {}); // memperbarui tampilan setelah data dihapus
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                    title: Text(kategoriPemasukan['kategori']),
                    subtitle: Text(kategoriPemasukan['foto']),
                    leading: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.download, color: Colors.green),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String?>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Buat Kategori'),
          content: TextFormField(
            controller: _pemasukanController,
            // controller: controller,
            autofocus: true,
            decoration:
                const InputDecoration(hintText: 'Masukan Nama Kategori'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                {
                  _saveKategoriPemasukan();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const kategori_pemasukan()));
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      );
}
