import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:moneyfreedom/database/DataPengeluaranService.dart';
import 'package:moneyfreedom/database/DataPemasukanService.dart';
import 'package:moneyfreedom/database/KategoriPengeluaranService.dart';
import 'package:moneyfreedom/database/KategoriPemasukanService.dart';
import 'create_transaction_pemasukan.dart';
import 'create_transaction_pengeluaran.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> Bulan = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String? selectedItem;
  List<String> Pilihan = ['Harian', 'Bulanan', 'Tahunan', 'Custom'];
  String? selected;
  int selectedBulan = DateTime.now().month - 1;

  DataPengeluaranService _dataPengeluaranService = DataPengeluaranService();
  DataPemasukanService _dataPemasukanService = DataPemasukanService();

  @override
  void initState() {
    super.initState();
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMMM');
    selectedItem = Bulan[DateTime.now().month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //button pasif income
          Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 192, 192, 192),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child:
                              const Icon(Icons.download, color: Colors.green),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pemasukan"),
                            SizedBox(height: 10),
                            StreamBuilder<int>(
                              stream: DataPemasukanService()
                                  .totalJumlahPemasukanStream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<int> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Text('Memuat...');
                                }

                                if (snapshot.hasError) {
                                  return Text(
                                      'Terjadi kesalahan saat memuat data');
                                }

                                final totalPengeluaran = snapshot.data ?? 0;
                                final formattedTotal =
                                    NumberFormat.decimalPattern('id_ID')
                                        .format(totalPengeluaran);

                                return Text('Rp. $formattedTotal');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(Icons.upload, color: Colors.red),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pengeluaran"),
                            SizedBox(height: 10),
                            StreamBuilder<int>(
                              stream: DataPengeluaranService()
                                  .totalJumlahPengeluaranStream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<int> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Text('Memuat...');
                                }

                                if (snapshot.hasError) {
                                  return const Text(
                                      'Terjadi kesalahan saat memuat data');
                                }

                                final totalPengeluaran = snapshot.data ?? 0;
                                final formattedTotal =
                                    NumberFormat.decimalPattern('id_ID')
                                        .format(totalPengeluaran);

                                return Text('Rp. $formattedTotal');
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
          //try row
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: DropdownButton<String>(
                    value: Bulan[selectedBulan],
                    items: Bulan.map((month) => DropdownMenuItem<String>(
                          value: month,
                          child: Text(month, style: TextStyle(fontSize: 18)),
                        )).toList(),
                    onChanged: (String? selectedMonth) {
                      setState(() {
                        selectedBulan = Bulan.indexOf(selectedMonth!);
                      });
                    },
                    icon: const Icon(Icons.repeat),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: DropdownButton<String>(
                      onChanged: (Pilihan) => selected,
                      // value: selected,
                      items: Pilihan.map((pilih) => DropdownMenuItem<String>(
                            value: pilih,
                            child: Text(pilih),
                          )).toList(),
                      // onChanged: (Pilihan) =>
                      //     setState(() => selected = Pilihan),
                      icon: const Icon(Icons.tune)),
                )
              ],
            ),
          ),
          //list transaksi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StreamBuilder<QuerySnapshot>(
              stream: DataPengeluaranService()
                  .dataPengeluaranPerBulanStream(selectedBulan + 1),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Terjadi kesalahan saat memuat data');
                }

                if (!snapshot.hasData) {
                  return Text('Belum ada data pengeluaran');
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final pengeluaran = snapshot.data!.docs[index];

                    return Card(
                      elevation: 10,
                      child: ListTile(
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Konfirmasi'),
                                      content: Text(
                                          'Apakah Anda yakin ingin menghapus data ini?'),
                                      actions: [
                                        TextButton(
                                          child: Text('Batal'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Menutup dialog
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Hapus'),
                                          onPressed: () async {
                                            await _dataPengeluaranService
                                                .hapusPengeluaran(
                                                    pengeluaran.id);
                                            setState(
                                                () {}); // Memperbarui tampilan setelah data dihapus
                                            Navigator.of(context)
                                                .pop(); // Menutup dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete),
                            ),
                            IconButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateTransactionPengeluaran())),
                                icon: Icon(Icons.edit)),
                          ],
                        ),
                        // title: Text("Rp ${pengeluaran['jumlah']}"),
                        title: Text(
                            "Rp ${NumberFormat.decimalPattern('id_ID').format(pengeluaran['jumlah'])}"),
                        subtitle: FutureBuilder<Object>(
                          future: KategoriPengeluaranService()
                              .getNamaKategoriPengeluaran(
                                  pengeluaran['kategori']),
                          builder: (BuildContext context,
                              AsyncSnapshot<Object> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text('Memuat...');
                            }
                            if (snapshot.hasError) {
                              return Text('Terjadi kesalahan saat memuat data');
                            }
                            return Text(snapshot.data.toString());
                          },
                        ),
                        leading: Container(
                          child: Icon(Icons.upload, color: Colors.red),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          //list uang masuk
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StreamBuilder<QuerySnapshot>(
              stream: DataPemasukanService()
                  .dataPemasukanPerBulanStream(selectedBulan + 1),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Terjadi kesalahan saat memuat data');
                }

                if (!snapshot.hasData) {
                  return Text('Belum ada data Pemasukan');
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Pemasukan = snapshot.data!.docs[index];

                    return Card(
                      elevation: 10,
                      child: ListTile(
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Konfirmasi'),
                                      content: Text(
                                          'Apakah Anda yakin ingin menghapus data ini?'),
                                      actions: [
                                        TextButton(
                                          child: Text('Batal'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Menutup dialog
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Hapus'),
                                          onPressed: () async {
                                            await _dataPemasukanService
                                                .hapusPemasukan(Pemasukan.id);
                                            setState(
                                                () {}); // Memperbarui tampilan setelah data dihapus
                                            Navigator.of(context)
                                                .pop(); // Menutup dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete),
                            ),
                            IconButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateTransactionPemasukan())),
                                icon: Icon(Icons.edit)),
                          ],
                        ),
                        // title: Text("Rp ${Pemasukan['jumlahPemasukan']}"),
                        title: Text(
                            "Rp ${NumberFormat.decimalPattern('id_ID').format(Pemasukan['jumlahPemasukan'])}"),
                        subtitle: FutureBuilder<Object>(
                          future: KategoriPemasukanService()
                              .getNamaKategoriPemasukan(
                                  Pemasukan['kategoriPemasukan']),
                          builder: (BuildContext context,
                              AsyncSnapshot<Object> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text('Memuat...');
                            }
                            if (snapshot.hasError) {
                              return Text('Terjadi kesalahan saat memuat data');
                            }
                            return Text(snapshot.data.toString());
                          },
                        ),
                        leading: Container(
                          child: Icon(Icons.download, color: Colors.green),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
