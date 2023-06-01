import 'package:flutter/material.dart';

import 'menu_button.dart';

class profil_page extends StatelessWidget {
  const profil_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profil'),
          leading: BackButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MenuButton())),
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        'images/man (2).png',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: Container(
                          width: 340,
                          height: 360,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Pilih Avatar',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/man (1).png'),
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/man (2).png'),
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/man (3).png'),
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/man.png'),
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/woman (1).png'),
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/woman (2).png'),
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/woman (3).png'),
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/woman.png'),
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Batal',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Konfirmasi',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.blue.shade300,
                ),
                child: const Text(
                  'Ganti Avatar',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.61,
                    ),
                    child: const Text(
                      "Nama",
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 40,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white60,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        // hintText: 'User'
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => MenuButton())),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Batal",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => MenuButton())),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 13),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Colors.blue.shade500,
                      ),
                      child: const Text(
                        "Simpan",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
