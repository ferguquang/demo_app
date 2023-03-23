import 'package:workflow_manager/base/models/base_response.dart';

class ExportResponse extends BaseResponse {
  Data data;

  ExportResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }
}

class Data {
  String fileName;
  String path;

  Data({this.fileName, this.path});

  Data.fromJson(Map<String, dynamic> json) {
    fileName = json['FileName'];
    path = json['Path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FileName'] = this.fileName;
    data['Path'] = this.path;
    return data;
  }
}