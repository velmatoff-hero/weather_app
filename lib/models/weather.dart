class Weather {
  String title;
  String latt_long;

  Weather({this.title, this.latt_long});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(title: json['title'], latt_long: json['latt_long']);
  }
}
