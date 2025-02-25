import 'package:flutter/material.dart';
import 'member_tim.dart';
import 'identifikasi_bilangan.dart';
import 'math_operation.dart';
import 'total_penjumlahan.dart';
import 'login_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color.fromARGB(255, 243, 221, 191),
      body: Center(
        child: SizedBox(
          width: 300,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 5, // Tambah satu item untuk tombol logout
            itemBuilder: (context, index) {
              final items = [
                {
                  'title': 'Data Anggota Kelompok',
                  'color': const Color.fromARGB(255, 176, 73, 73),
                  'page': MemberListScreen()
                },
                {
                  'title': 'Operasi Matematika',
                  'color': const Color.fromARGB(255, 176, 73, 73),
                  'page': MathOperationsScreen()
                },
                {
                  'title': 'Bilangan Ganjil / Genap',
                  'color': const Color.fromARGB(255, 176, 73, 73),
                  'page': EvenOddScreen()
                },
                {
                  'title': 'Jumlah Total Angka',
                  'color': const Color.fromARGB(255, 176, 73, 73),
                  'page': TotalSumScreen()
                },
                {
                  'title': 'Logout',
                  'color': const Color.fromARGB(255, 135, 135, 135), // Warna berbeda untuk logout
                  'page': null // Tidak perlu halaman tujuan
                },
              ];

              if (index == 4) {
                // Tambahkan fungsi logout khusus
                return _buildLogoutCard(context, items[index]['title'] as String, items[index]['color'] as Color);
              } else {
                return _buildCard(
                  context,
                  items[index]['title'] as String,
                  items[index]['color'] as Color,
                  items[index]['page'] as Widget,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, Color color, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutCard(BuildContext context, String title, Color color) {
    return GestureDetector(
      onTap: () {
        // Menampilkan notifikasi sebelum logout
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Berhasil Logout!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        // Tunggu sebentar sebelum pindah halaman
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false, // Menghapus semua halaman sebelumnya
          );
        });
      },
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.exit_to_app, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
