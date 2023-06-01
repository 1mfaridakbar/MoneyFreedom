// ignore_for_file: file_names

/**
 * @Author: Your name
 * @Date:   2023-02-16 01:21:44
 * @Last Modified by:   Your name
 * @Last Modified time: 2023-02-19 21:04:30
 */
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class monthlist extends StatefulWidget {
  const monthlist({super.key});

  @override
  State<monthlist> createState() => _monthlistState();
}

class _monthlistState extends State<monthlist> {
  List<String> Bulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];
  String? selectedItem = 'Januari';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: selectedItem,
          items: Bulan.map((month) => DropdownMenuItem<String>(
            value: month,
            child: Text(month, style: TextStyle(fontSize: 10)),
          )).toList(),
          onChanged: (Bulan) => setState(() => selectedItem = Bulan),
        ),
      ),
      //   appBar: AppBar(actions: [
      //     PopupMenuButton(
      //       itemBuilder: (context) => [
      //         PopupMenuItem(child: Text('Januari')),
      //         PopupMenuItem(child: Text('Februari')),
      //         PopupMenuItem(child: Text('Maret')),
      //         PopupMenuItem(child: Text('April')),
      //         PopupMenuItem(child: Text('Mei')),
      //         PopupMenuItem(child: Text('Juni')),
      //         PopupMenuItem(child: Text('Juli')),
      //         PopupMenuItem(child: Text('Agustus')),
      //         PopupMenuItem(child: Text('September')),
      //         PopupMenuItem(child: Text('Oktober')),
      //         PopupMenuItem(child: Text('November')),
      //         PopupMenuItem(child: Text('Desember')),
      //       ],
      //     )
      //   ]),
    );
    // }

//     Scaffold(
//       body: Column(
//         children: [
//           listDataView(),
//         ],
//       ),
//     );
//   }

//   Widget listDataView() {
//     return Flexible(
//         child: ListView.builder(
//             itemCount: dataList.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text('${dataList[index]}'),
//               );
//             }));
//   }
  }
}
