import 'package:flutter/material.dart';

class setting_page extends StatelessWidget {
  const setting_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text('Pengaturan'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Card(
                elevation: 2.0,
                margin: const EdgeInsets.fromLTRB(5, 8, 5, 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    settingOption(context, 'Ganti Tema'),
                    const Divider(height: 20, thickness: 1),
                    settingOption(context, 'Pengingat'),
                    const Divider(height: 20, thickness: 1),
                    settingOption(context, 'Atur Pin'),
                    const Divider(height: 20, thickness: 1),
                    settingOption(context, 'Sinkronisasi'),
                    SizedBox(height: 15),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

GestureDetector settingOption(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("Option 1"),
                  Text("Option 2"),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Close"))
              ],
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600])),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 25),
        ],
      ),
    ),
  );
}
