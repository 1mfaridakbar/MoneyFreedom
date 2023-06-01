import 'package:flutter/material.dart';

class Penggunaan extends StatefulWidget {
  const Penggunaan({super.key});

  @override
  State<Penggunaan> createState() => _PenggunaanState();
}

class _PenggunaanState extends State<Penggunaan> {
  List<String> Pilihan = ['Harian', 'Bulanan', 'Tahunan', 'Custom'];
  String? selected = 'Harian';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: selected,
          items: Pilihan.map((pilih) => DropdownMenuItem<String>(
            value: pilih,
            child: Text(pilih, style: TextStyle(fontSize: 10)),
          )).toList(),
          onChanged: (Pilihan) => setState(() => selected = Pilihan),
        ),
      ),
    );
  }
}
