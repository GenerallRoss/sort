import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sort/graph.dart';
import 'package:sort/lists.dart';
import 'package:sort/qsort.dart';
import 'binary_search.dart';

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
                    if (kDebugMode) {
                      print(values);
                    }
                    DateTime startTime = DateTime.now();
                    debugPrint('Время начала: $startTime');
                    int high = values.length - 1;
                    int low = 0;
                    List<int> result = quickSort(values, low, high);
                    if (kDebugMode) {
                      print(result);
                    }
                    DateTime endTime = DateTime.now();
                    debugPrint('Время окончания: $endTime');
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
                    'Бинарный поиск',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    debugPrint('Время начала: ${DateTime.now()}');
                    int min = 0;
                    int max = values.length - 1;
                    myBinarySearch(values, 354, min, max);
                    debugPrint('Время окончания: ${DateTime.now()}');
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
                    'Поиск в глубину и ширину',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    MyGraph graph = initGraph();
                    searchGraph(6, graph, [], []);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
