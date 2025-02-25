import 'package:flutter/material.dart';

class EvenOddScreen extends StatefulWidget {
  @override
  _EvenOddScreenState createState() => _EvenOddScreenState();
}

class _EvenOddScreenState extends State<EvenOddScreen> {
  final TextEditingController numController = TextEditingController();
  String result = '';

  void checkEvenOdd() { 
    BigInt? num = BigInt.tryParse(numController.text);
    setState(() {
      if (num == null) {
        result = 'Angka tidak valid!';
      } else {
        result = (num.isEven) ? 'Genap' : 'Ganjil';
      }
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Cek Bilangan'),
      centerTitle: true, // Pusatkan title
    ),
      backgroundColor: const Color.fromARGB(255, 243, 221, 191), // Warna latar belakang
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 176, 73, 73), // Warna Card
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: numController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan angka',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkEvenOdd,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Warna tombol
                  foregroundColor: Colors.black, // Warna teks
                ),
                child: Text('Cek'),
              ),
              SizedBox(height: 20),
              Text(
                'Hasil: $result',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}