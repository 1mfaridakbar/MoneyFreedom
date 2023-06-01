import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moneyfreedom/Screens//analyst_page.dart';
import 'package:moneyfreedom/Screens/home_screen.dart';
import 'package:moneyfreedom/Screens/create_transaction_pengeluaran.dart';
import 'package:moneyfreedom/Sidebar/drawer_navigation.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => MenuButtonState();
}

class MenuButtonState extends State<MenuButton> {
  final List<Widget> _children = [
    HomeScreen(),
    AnalystPage(),
  ]; // untuk pemanggilan button dibawah
  int currentIndex = 0;

  void ontaptapped(int index) {
    //untuk memanggil isi buttonnya
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false, // simple as that!
          toolbarHeight: 75, // default is 56
          toolbarOpacity: 0.5,

          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ),
          ],

          backgroundColor: Colors.blue,
        ),
        drawer: const DrawerNavigation(
          width: 100,
        ),
        floatingActionButton: Visibility(
          visible: (currentIndex == 0) ? true : false,
          child: FloatingActionButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateTransactionPengeluaran())),
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.add),
          ),
        ),
        body: _children[currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {
                  ontaptapped(0);
                },
                icon: const Icon(Icons.home)),
            const SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  ontaptapped(1);
                },
                icon: const Icon(Icons.bar_chart))
          ]),
        ));
  }
}
