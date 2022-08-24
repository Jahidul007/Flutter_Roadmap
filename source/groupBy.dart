void main() {
  List<Model> data = [
    Model("A", 'php', "test"),
    Model("A", 'flutter', 'engineer1'),
    Model("A", 'flutter', 'engineer2'),
    Model('B', 'c sharp', 'engineer1'),
    Model('B', 'c sharp', 'engineer2'),
    Model('B', 'dot net', 'engineer2'),
    Model('B', 'php', 'engineer2'),
    Model('C', 'php', 'engineer2'),
    Model('C', 'php', 'engineer1')
  ];

  Map<String, dynamic> group = {};
 
  final releaseDateMap = data.groupBy((m) => m.team);

  print(releaseDateMap);
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

/// model class
class Model {
  Model(this.team, this.projectName, this.engineersName);
  String team;
  String projectName;
  String engineersName;
}
