import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Kedua'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama barang: ${args['namaBarang']}'),
            SizedBox(height: 12),
            Text('Deskripsi: ${args['deskripsi']}'),
            SizedBox(height: 12),
            Text('Harga: ${args['harga']}'),
            SizedBox(height: 12),
            Text('Kondisi barang: ${args['kondisiBarang']}'),
            SizedBox(height: 12),
            Text('Pengiriman dalam kota saja: ${args['pengiriman']}'),
            SizedBox(height: 12),
            Text('Menerima retur: ${args['retur']}'),
            SizedBox(height: 12),
            Text('Dikerjakan oleh: 6701213059 - Muhammad Fathi Farhat'),
          ],
        ),
      ),
    );
  }
}