import 'package:flutter/material.dart';


class TinhBmi extends StatefulWidget {
  const TinhBmi({super.key});

  @override
  State<TinhBmi> createState() => _TinhBmiState();
}

class _TinhBmiState extends State<TinhBmi> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double? _bmi;

  void _calculateBmi() {
    final double? height = double.tryParse(_heightController.text);
    final double? weight = double.tryParse(_weightController.text);

    if (height != null && weight != null && height > 0) {
      setState(() {
        _bmi = weight / ((height / 100) * (height / 100));
        if (_bmi != null) {
          if (_bmi! < 18.5) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Bạn bị thiếu cân')),
            );
          } else if (_bmi! < 24.9) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Bạn có cân nặng bình thường')),
            );
          } else if (_bmi! < 29.9) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Bạn bị thừa cân')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Bạn bị béo phì')),
            );
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tính chỉ số BMI"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                icon: Icon(Icons.height),
                labelText: 'Chiều cao (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                icon: Icon(Icons.monitor_weight),
                labelText: 'Cân nặng (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateBmi,
              child: const Text('Tính BMI'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _bmi != null
                  ? 'Chỉ số BMI của bạn là: ${_bmi!.toStringAsFixed(2)}'
                  : 'Chỉ số BMI của bạn là: ',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}