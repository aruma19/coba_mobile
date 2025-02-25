import 'package:flutter/material.dart';

class MathOperationsScreen extends StatefulWidget {
  @override
  _MathOperationsScreenState createState() => _MathOperationsScreenState();
}

class _MathOperationsScreenState extends State<MathOperationsScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double result = 0;
  String? errorTextNum1;
  String? errorTextNum2;

  void calculate(String operation) {
    setState(() {
      errorTextNum1 = null;
      errorTextNum2 = null;
    });

    double? num1 = double.tryParse(num1Controller.text);
    double? num2 = double.tryParse(num2Controller.text);

    if (num1 == null) {
      setState(() {
        errorTextNum1 = 'Masukkan angka yang valid!';
      });
    }
    if (num2 == null) {
      setState(() {
        errorTextNum2 = 'Masukkan angka yang valid!';
      });
    }

    if (num1 == null || num2 == null) return;

    setState(() {
      switch (operation) {
        case "add":
          result = num1 + num2;
          break;
        case "subtract":
          result = num1 - num2;
          break;
        case "multiply":
          result = num1 * num2;
          break;
        case "divide":
          result = num2 != 0 ? num1 / num2 : double.infinity;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operasi Matematika'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 243, 221, 191),
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 176, 73, 73),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Angka 1', 
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (errorTextNum1 != null) // Menampilkan error dengan teks putih
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    errorTextNum1!,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(height: 10),
              TextField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Angka 2',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (errorTextNum2 != null) // Menampilkan error dengan teks putih
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    errorTextNum2!,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => calculate("add"),
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => calculate("subtract"),
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => calculate("multiply"),
                    child: Text('*'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => calculate("divide"),
                    child: Text('/'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Hasil: ${result.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20, 
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}