import 'package:flutter/material.dart';

class MyGraph {
  int value;
  List<MyGraph>? nextGraphs;

  MyGraph(this.value, {this.nextGraphs});

  void addNextGraph(MyGraph graph) {
    if (nextGraphs != null) {
      nextGraphs!.add(graph);
    } else {
      nextGraphs = [];
      nextGraphs!.add(graph);
    }
  }
}

MyGraph initGraph() {
  MyGraph firstGraph = MyGraph(0);
  MyGraph secondGraph = MyGraph(1);
  MyGraph thirdGraph = MyGraph(2);
  MyGraph fourthGraph = MyGraph(3);
  MyGraph fifthGraph = MyGraph(4);
  MyGraph sixthGraph = MyGraph(5);
  MyGraph seventhGraph = MyGraph(6);

  firstGraph.addNextGraph(secondGraph);
  firstGraph.addNextGraph(thirdGraph);

  secondGraph.addNextGraph(thirdGraph);
  secondGraph.addNextGraph(fourthGraph);

  thirdGraph.addNextGraph(fourthGraph);

  fourthGraph.addNextGraph(fifthGraph);

  fifthGraph.addNextGraph(firstGraph);
  fifthGraph.addNextGraph(secondGraph);
  fifthGraph.addNextGraph(sixthGraph);

  sixthGraph.addNextGraph(seventhGraph);

  return firstGraph;
}

// Поиск в ширину (breadth-first search)
// ignore: non_constant_identifier_names
void BFSgraph(int searchValue, MyGraph graph, List<int> checkedValues,
    List<MyGraph> checkedGraphs) {
  if (graph.value == searchValue) {
    debugPrint('Искомое значение найдено');
    return;
  } else if (graph.nextGraphs != null) {
    checkedValues.add(graph.value);
    for (int i = 0; i < graph.nextGraphs!.length; i++) {
      if (!checkedValues.contains(graph.nextGraphs![i].value)) {
        debugPrint('Проверяем ${graph.nextGraphs![i].value}');
        if (graph.nextGraphs![i].value == searchValue) {
          debugPrint('Искомое значение найдено');
          return;
        } else {
          checkedValues.add(graph.nextGraphs![i].value);
        }
      }
    }
    checkedGraphs.add(graph);
    for (int i = 0; i < graph.nextGraphs!.length; i++) {
      if (!checkedGraphs.contains(graph.nextGraphs![i])) {
        BFSgraph(
            searchValue, graph.nextGraphs![i], checkedValues, checkedGraphs);
        return;
      }
    }
  } else {
    debugPrint('Искомого значения нет в графе');
  }
}

// Поиск в глубину (Depth-first search)
// ignore: non_constant_identifier_names
void DFSgraph(int searchValue, MyGraph graph, List<MyGraph> searchedGraphs) {
  if (graph.value == searchValue) {
    debugPrint('Значение найдено');
    return;
  } else if (graph.nextGraphs != null) {
    searchedGraphs.add(graph);
    for (int i = 0; i < graph.nextGraphs!.length; i++) {
      if (!searchedGraphs.contains(graph.nextGraphs![i])) {
        debugPrint('Проверяем ${graph.nextGraphs![i].value}');
        DFSgraph(searchValue, graph.nextGraphs![i], searchedGraphs);
      }
    }
  }
}
