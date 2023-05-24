import 'package:flutter/material.dart';
import 'secondpage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'vsi2k4.assessment1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  String? kondisiBarang;
  bool isPengirimanDalamKota = false;
  bool isMenerimaRetur = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('vsi2k4.assessment1'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: namaBarangController,
              decoration: InputDecoration(
                labelText: 'Nama barang',
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: deskripsiController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: hargaController,
              decoration: InputDecoration(
                labelText: 'Harga',
              ),
            ),
            SizedBox(height: 12),
            Text('Kondisi barang'),
            Row(
              children: [
                Radio<String>(
                  value: 'Barang Bekas',
                  groupValue: kondisiBarang,
                  onChanged: (String? value) {
                    setState(() {
                      kondisiBarang = value;
                    });
                  },
                ),
                Text('Barang Bekas'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Barang Baru',
                  groupValue: kondisiBarang,
                  onChanged: (String? value) {
                    setState(() {
                      kondisiBarang = value;
                    });
                  },
                ),
                Text('Barang Baru'),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pengiriman dalam kota'),
                Checkbox(
                  value: isPengirimanDalamKota,
                  onChanged: (bool? value) {
                    setState(() {
                      isPengirimanDalamKota = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Menerima retur'),
                Checkbox(
                  value: isMenerimaRetur,
                  onChanged: (bool? value) {
                    setState(() {
                      isMenerimaRetur = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                if (kondisiBarang != null) {
                  Navigator.pushNamed(
                    context,
                    '/second',
                    arguments: {
                      'namaBarang': namaBarangController.text,
                      'deskripsi': deskripsiController.text,
                      'harga': hargaController.text,
                      'kondisiBarang': kondisiBarang,
                      'pengiriman': isPengirimanDalamKota ? 'Ya' : 'Tidak',
                      'retur': isMenerimaRetur ? 'Ya' : 'Tidak',
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Peringatan'),
                        content: Text('Silahkan pilih kondisi barang.'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('PUBLIKASIKAN'),
            ),
          ],
        ),
      ),
    );
  }
}