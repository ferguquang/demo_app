import 'package:workflow_manager/base/models/base_response.dart';

import 'get_record_field_settings_by_id_type_response.dart';

class GetStgDocFieldSettingsByIDTypeResponse extends BaseResponse {
  Data data;

  GetStgDocFieldSettingsByIDTypeResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }
}

class Data {
  List<RecordFieldSettings> stgDocFieldSettings;

  Data({this.stgDocFieldSettings});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['StgDocFieldSettings'] != null) {
      stgDocFieldSettings = <RecordFieldSettings>[];
      json['StgDocFieldSettings'].forEach((v) {
        stgDocFieldSettings.add(new RecordFieldSettings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stgDocFieldSettings != null) {
      data['StgDocFieldSettings'] =
          this.stgDocFieldSettings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

