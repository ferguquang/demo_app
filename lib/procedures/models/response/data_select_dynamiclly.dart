class DataSelectDynamiclly {
  String total;
  dynamic value;

  DataSelectDynamiclly.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['Total'] = total;
    json['Value'] = value;
    return json;
  }
}
