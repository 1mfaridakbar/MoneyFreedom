import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:moneyfreedom/database/DataPengeluaranService.dart';
import 'package:moneyfreedom/database/DataPemasukanService.dart';
import 'package:moneyfreedom/database/KategoriPengeluaranService.dart';
import 'package:moneyfreedom/database/KategoriPemasukanService.dart';

class AnalystPage extends StatefulWidget {
  @override
  _AnalystPageState createState() => _AnalystPageState();
}

class _AnalystPageState extends State<AnalystPage> {
  final DataPengeluaranService pengeluaranService = DataPengeluaranService();
  final DataPemasukanService pemasukanService = DataPemasukanService();

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.limeAccent,
    Colors.redAccent,
  ];

  bool isPengeluaranSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 40,
              margin: const EdgeInsets.only(
                bottom: 10,
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPengeluaranSelected = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      backgroundColor: isPengeluaranSelected
                          ? Colors.blue.shade500
                          : Colors.transparent,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.47, 40),
                    ),
                    child: const Text(
                      "Pengeluaran",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPengeluaranSelected = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: !isPengeluaranSelected
                          ? Colors.blue.shade500
                          : Colors.transparent,
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.47, 40),
                    ),
                    child: const Text(
                      "Pemasukan",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              height: 450,
              child: isPengeluaranSelected
                  ? StreamBuilder<Map<String, int>>(
                      stream: pengeluaranService
                          .totalJumlahPengeluaranPerKategoriStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final namaKategori = KategoriPengeluaranService()
                              .getNamaKategoriPengeluaran('kategori');
                          final dataMap = snapshot.data!;
                          final totalPengeluaran =
                              dataMap.values.reduce((a, b) => a + b);
                          return Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                width: 400,
                                height: 450,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total Pengeluaran',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Rp ${NumberFormat.decimalPattern('id_ID').format(totalPengeluaran)}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    SizedBox(
                                      child: PieChart(
                                        dataMap: dataMap.map((kategori, total) {
                                          return MapEntry(
                                              kategori, total.toDouble());
                                        }),
                                        chartType: ChartType.disc,
                                        baseChartColor:
                                            Colors.black54.withOpacity(0.1),
                                        colorList: colorList,
                                        legendOptions: const LegendOptions(
                                          legendPosition: LegendPosition.bottom,
                                        ),
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                          showChartValuesInPercentage: true,
                                          showChartValueBackground: false,
                                        ),
                                        totalValue: totalPengeluaran.toDouble(),
                                      ),
                                      height: 350,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else {
                          return Text(
                            'Silahkan input Pengeluaran terlebih dahulu',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                      },
                    )
                  : Container(
                      width: 400,
                      height: 450,
                      child: !isPengeluaranSelected
                          ? StreamBuilder<Map<String, int>>(
                              stream: pemasukanService
                                  .totalJumlahPemasukanPerKategoriStream,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final namaKategori =
                                      KategoriPemasukanService()
                                          .getNamaKategoriPemasukan('kategori');
                                  final dataMap = snapshot.data!;
                                  final totalPemasukan =
                                      dataMap.values.reduce((a, b) => a + b);
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Container(
                                        width: 400,
                                        height: 450,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Total Pemasukan',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              'Rp ${NumberFormat.decimalPattern('id_ID').format(totalPemasukan)}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            SizedBox(
                                              child: PieChart(
                                                dataMap: dataMap
                                                    .map((kategori, total) {
                                                  return MapEntry(kategori,
                                                      total.toDouble());
                                                }),
                                                chartType: ChartType.disc,
                                                baseChartColor: Colors.black54
                                                    .withOpacity(0.1),
                                                colorList: colorList,
                                                legendOptions:
                                                    const LegendOptions(
                                                  legendPosition:
                                                      LegendPosition.bottom,
                                                ),
                                                chartValuesOptions:
                                                    const ChartValuesOptions(
                                                  showChartValuesInPercentage:
                                                      true,
                                                  showChartValueBackground:
                                                      false,
                                                ),
                                                totalValue:
                                                    totalPemasukan.toDouble(),
                                              ),
                                              height: 350,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else {
                                  return Text(
                                    'Silahkan input pemasukan terlebih dahulu',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              },
                            )
                          : Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Silahkan input pemasukan atau pengeluaran terlebih dahulu',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ), // Container kosong jika pemasukan yang dipilih
            ),
          ],
        ),
      ),
    );
  }
}
