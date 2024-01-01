class StatModel {
  String? name;
  double? points;

  StatModel({this.name, this.points});

  StatModel.fromJson(Map<String, dynamic> json) {
    name = json['stat']['name'];
    points = json['base_stat'].toDouble();
  }
}
