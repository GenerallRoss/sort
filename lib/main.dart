import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sort/lists.dart';
import 'package:sort/qsort.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 5,
              color: Colors.blue,
              child: MaterialButton(
                  child: const Text(
                    'Сгенерировать значения',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    int maxValue = 1000;
                    int sizeOfList = 100000;
                    Random rnd = Random();
                    for (int i = 0; i < sizeOfList; i++) {
                      values.add(rnd.nextInt(maxValue) + 1);
                      debugPrint(values[i].toString());
                    }
                  }),
            ),
            const SizedBox(
              height: 50,
            ),
            Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 5,
              color: Colors.blue,
              child: MaterialButton(
                  child: const Text(
                    'Сортировать',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    DateTime startTime = DateTime.now();
                    debugPrint('Время начала: $startTime');
                    int high = values.length - 1;
                    int low = 0;
                    List<int> result = quickSort(values, low, high);
                    print(result);
                    DateTime endTime = DateTime.now();
                    debugPrint('Время окончания: $endTime');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
