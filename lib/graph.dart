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

  firstGraph.addNextGraph(secondGraph);
  firstGraph.addNextGraph(thirdGraph);

  secondGraph.addNextGraph(thirdGraph);
  secondGraph.addNextGraph(fourthGraph);

  thirdGraph.addNextGraph(fourthGraph);

  fourthGraph.addNextGraph(fifthGraph);

  fifthGraph.addNextGraph(firstGraph);
  fifthGraph.addNextGraph(secondGraph);
  fifthGraph.addNextGraph(sixthGraph);

  return firstGraph;
}
