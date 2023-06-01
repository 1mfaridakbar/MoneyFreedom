import 'package:flutter/material.dart';
import 'package:moneyfreedom/Screens/about_page.dart';
import 'package:moneyfreedom/Screens/help_page.dart';
import 'package:moneyfreedom/Screens/setting_page.dart';
import 'package:moneyfreedom/Screens/profil_page.dart';

import '../database/profilService.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key, required double width}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  final ProfilService _profilService = ProfilService();
  late Future<String> _namaProfilTerakhir;

  @override
  void initState() {
    super.initState();
    _namaProfilTerakhir = _profilService.getNamaProfilTerakhir();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/man (2).png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    FutureBuilder<String>(
                      future: _namaProfilTerakhir,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(
                            'Error',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          );
                        } else {
                          final namaProfil = snapshot.data ?? 'User';
                          return Text(
                            namaProfil,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            buildMenuItem(
              text: 'Edit Profil',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 0),
            ),
            SizedBox(height: 25),
            buildMenuItem(
              text: 'Pengaturan',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 1),
            ),
            SizedBox(height: 25),
            buildMenuItem(
              text: 'Beri Penilaian',
              icon: Icons.star,
            ),
            SizedBox(height: 25),
            buildMenuItem(
              text: 'Bantuan',
              icon: Icons.question_mark_rounded,
              onClicked: () => selectedItem(context, 2),
            ),
            SizedBox(height: 25),
            buildMenuItem(
              text: 'Tentang',
              icon: Icons.info,
              onClicked: () => selectedItem(context, 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    const hoverColor = Colors.white12;

    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(icon, color: color, size: 35),
      ),
      title: Text(text, style: TextStyle(color: color, fontSize: 15)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const profil_page()));
        break;
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const setting_page()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => help_page()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const about_page()));
        break;
    }
  }
}
