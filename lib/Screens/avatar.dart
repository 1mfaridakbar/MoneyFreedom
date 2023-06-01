import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'menu_button.dart';

class avatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Image.asset(
          "images/Registrasi Avatar.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.31,
            width: MediaQuery.of(context).size.width,
          ),
          const Text(
            'Pilih Avatarmu',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'HindVadodara-Regular',
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 25,
              right: 25,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/man.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/man (1).png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/man (2).png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/man (3).png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 10,
              left: 25,
              right: 25,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/woman.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/woman (1).png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/woman (2).png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/woman (3).png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: MediaQuery.of(context).size.width * 0.33,
            ),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MenuButton())),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
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
        ]),
      ],
    ));
  }
}
