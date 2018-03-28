class Store {

  final String name;
  final String id;
  final String color;
  final String type;

  Store({
    this.name,
    this.id,
    this.color,
    this.type
  });


  Store.map(Map<String, dynamic> map) :
        id = map['id'],
        name = map['name'],
        type = map['type'],
        color = map['color'];
}