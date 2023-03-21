import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:workflow_manager/base/network/api_caller.dart';
import 'package:workflow_manager/base/network/app_url.dart';
import 'package:workflow_manager/storage/models/response/get_doc_field_settings_by_id_type_response.dart';
import 'package:workflow_manager/storage/models/response/get_record_field_settings_by_id_type_response.dart';

class ChildMultiTypeSearchRepository extends ChangeNotifier {
  List<RecordFieldSettings> fieldSettings = [];
  bool isRecordType = false; // loại văn bản hoặc loại hồ sơ

  Future<void> getData({@required String idType}) async {

    String url = isRecordType ? AppUrl.getRecordFieldSettingsByIDType : AppUrl.getStgDocFieldSettingsByIDType;
    var json = await ApiCaller.instance.get(
      url,
      params: {
        "idType": idType
      }
    );

    if (isRecordType) {
      GetRecordFieldSettingsByIDTypeResponse response = GetRecordFieldSettingsByIDTypeResponse.fromJson(json);
      fieldSettings = response.data.recordFieldSettings;
    } else {
      GetStgDocFieldSettingsByIDTypeResponse response = GetStgDocFieldSettingsByIDTypeResponse.fromJson(json);
      fieldSettings = response.data.stgDocFieldSettings;
    }

    // fieldSettings.addAll(fieldSettings);

    notifyListeners();
  }
}