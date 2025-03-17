import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark(),
      home: BMIScreen(),
    );
  }
}

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double? _bmi;
  String _message = "Nhập thông tin để tính BMI";

  void _calculateBMI() {
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);

    if (height == null || weight == null || height <= 0 || weight <= 0) {
      setState(() {
        _message = "Vui lòng nhập giá trị hợp lệ!";
        _bmi = null;
      });
      return;
    }

    double bmi = weight / ((height / 100) * (height / 100));
    setState(() {
      _bmi = bmi;
      if (bmi < 18.5) {
        _message = "Bạn đang thiếu cân";
      } else if (bmi < 24.9) {
        _message = "Bạn có cân nặng bình thường";
      } else if (bmi < 29.9) {
        _message = "Bạn đang thừa cân";
      } else {
        _message = "Bạn bị béo phì!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Chiều cao (cm)"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Cân nặng (kg)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text("Tính BMI"),
            ),
            SizedBox(height: 20),
            if (_bmi != null)
              Text(
                "BMI: ${_bmi!.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 10),
            Text(
              _message,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
