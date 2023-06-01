import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moneyfreedom/database/KategoriPengeluaranService.dart';
import 'create_transaction_pengeluaran.dart';

class kategori_pengeluaran extends StatefulWidget {
  const kategori_pengeluaran({Key? key}) : super(key: key);

  @override
  State<kategori_pengeluaran> createState() => _kategori_pengeluaranState();
}

class _kategori_pengeluaranState extends State<kategori_pengeluaran> {
  final CollectionReference _kategoriPengeluaran =
      FirebaseFirestore.instance.collection('kategoriPengeluaran');
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController _pengeluaranController = TextEditingController();

  void _saveKategoriPengeluaran() async {
    // Mengambil inputan dari form
    String fotoUrl = "";
    String kategori = _pengeluaranController.text;
    DateTime dateTime = DateTime.now();
    Timestamp tanggal = Timestamp.fromDate(dateTime);

    // Membuat objek data pengeluaran
    Map<String, dynamic> data = {
      "fotoUrl": fotoUrl,
      "kategori": kategori,
      "tanggal": dateTime,
    };

    // Menyimpan data ke Firestore
    await _kategoriPengeluaranService.tambahKategoriPengeluaran( fotoUrl, kategori, tanggal);
  }

  final KategoriPengeluaranService _kategoriPengeluaranService = KategoriPengeluaranService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Kategori'),
        leading: BackButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context)=>CreateTransactionPengeluaran())),
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
          stream: KategoriPengeluaranService().KategoriPengeluaranStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Terjadi kesalahan saat memuat data');
            }

            if (!snapshot.hasData) {
              return const Text('Belum ada data pengeluaran');
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final kategoriPengeluaran = snapshot.data!.docs[index];

                return Card(
                  elevation: 10,
                  child: ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () async {
                          await _kategoriPengeluaranService.hapusKategoriPengeluaran(kategoriPengeluaran.id); // menghapus data dari Firestore
                          setState((){}); // memperbarui tampilan setelah data dihapus
                          }, icon: const Icon(Icons.delete)),
                      ],
                    ),
                    title: Text(kategoriPengeluaran['kategori']),
                    subtitle: Text(kategoriPengeluaran['foto']),
                    leading: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.upload, color: Colors.red),
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
        controller: _pengeluaranController,
        autofocus: true,
        decoration: const InputDecoration(
            hintText: 'Masukan Nama Kategori'
        ),
      ),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: (){
            {
              _saveKategoriPengeluaran();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context)=>const kategori_pengeluaran()));
            }
          },
          child: const Text('Simpan'),
        ),
      ],
    ),
  );
}
