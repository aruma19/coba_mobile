import 'package:flutter/material.dart';

class TotalSumScreen extends StatefulWidget {
  @override
  _TotalSumScreenState createState() => _TotalSumScreenState();
}

class _TotalSumScreenState extends State<TotalSumScreen> {
  final TextEditingController numbersController = TextEditingController();
  int total = 0;
  String errorMessage = ''; // Menyimpan pesan error

  void calculateSum() {
    String input = numbersController.text;

    // Validasi: hanya boleh angka dan koma, tidak boleh ada spasi
    if (!RegExp(r'^[0-9,]+$').hasMatch(input)) {
      setState(() {
        errorMessage = 'Input hanya boleh berisi angka dan koma tanpa spasi';
        total = 0; // Reset total jika ada kesalahan input
      });
      return;
    }

    // Pisahkan input berdasarkan koma dan konversi ke int
    List<int> numbers = input
        .split(',')
        .map((e) => int.tryParse(e) ?? 0)
        .toList();

    setState(() {
      total = numbers.reduce((a, b) => a + b);
      errorMessage = ''; // Hapus pesan error jika input benar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jumlah Total Angka'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 243, 221, 191),
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 176, 73, 73),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: numbersController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Masukkan angka (pisah dengan koma, tanpa spasi)',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 10),
              if (errorMessage.isNotEmpty) // Jika ada error, tampilkan pesan
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: calculateSum,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: Text('Hitung'),
              ),
              SizedBox(height: 20),
              Text(
                'Total: $total',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
