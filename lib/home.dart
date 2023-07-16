import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool isMale = true;
double heightVal = 170;
int weight = 55;
int age = 18;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'male'),
                    const SizedBox(
                      width: 15,
                    ),
                    m1Expanded(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              heightVal.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Text(
                              'CM',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        Slider(
                          min: 90,
                          max: 240,
                          value: heightVal,
                          onChanged: (newValu) {
                            setState(() {
                              heightVal = newValu;
                            });
                          },
                        )
                      ],
                    )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'weight'),
                    const SizedBox(
                      width: 15,
                    ),
                    m2Expanded(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 15,
              child: TextButton(
                child: Text(
                  'Calculate',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                onPressed: () {
                  var result = weight / pow(heightVal / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Result(result: result, age: age, isMale: isMale);
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(height: 15),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'age' : 'weight',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 15),
            Text(
              type == 'age' ? "$age" : '$weight',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  mini: true,
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 15),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  mini: true,
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
