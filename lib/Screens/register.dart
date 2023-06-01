import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moneyfreedom/Screens/avatar.dart';
import 'package:moneyfreedom/database/profilService.dart';

class register extends StatelessWidget {
  register({super.key});

  final CollectionReference _kategoriPemasukan =
      FirebaseFirestore.instance.collection('Profil');
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController _profilController = TextEditingController();

  final ProfilService _profilService = ProfilService();

  void _saveProfilNama() async {
    // Mengambil inputan dari form
    String namaProfil = _profilController.text;
    String kodeAvatar = "";
    Timestamp WaktuProfil = Timestamp.now();

    // Membuat objek data pengeluaran
    Map<String, dynamic> data = {
      "namaProfil": namaProfil,
      "kodeAvatar": kodeAvatar,
      "WaktuProfil": WaktuProfil
    };

    // Menyimpan data ke Firestore
    await _profilService.tambahProfil(namaProfil, kodeAvatar, WaktuProfil);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, // Tidak mengizinkan tampilan berubah saat keyboard muncul
        body: Stack(
          children: <Widget>[
            Image.asset(
              "images/Registrasi.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    0.4, // 20% tinggi layar,
                bottom: MediaQuery.of(context).size.height *
                    0.08, // 8% tinggi layar
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.67,
                    ),
                    child: const Text(
                      "Nama",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _profilController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    // onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => avatarPage())),
                    onPressed: () {
                      _saveProfilNama();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => avatarPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      "Mulai",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
