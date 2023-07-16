// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.result,
      required this.age,
      required this.isMale});
  final double result;
  final int age;
  final bool isMale;

  String get resultPhrse {
    String resultText = '';
    if (result >= 30)
      resultText = 'Obese';
    else if (result > 25 && result < 30)
      resultText = 'OverWeight';
    else if (result >= 18.5 && result <= 24.9)
      resultText = 'Normal';
    else
      resultText = 'thin';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Gender : ${isMale ? 'male' : 'femal'}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Result : ${result.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Healthiness : $resultPhrse',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                'Age : $age',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
