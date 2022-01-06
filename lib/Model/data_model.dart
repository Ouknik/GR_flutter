class DataModel {
  late String name, desk, prx;
  DataModel({required this.desk, required this.name, required this.prx});
  DataModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    desk = map['desk'];
    prx = map['prx'];
  }
  toJson() {
    return {
      'name': name,
      'desk': desk,
      'prx': prx,
    };
  }
}
