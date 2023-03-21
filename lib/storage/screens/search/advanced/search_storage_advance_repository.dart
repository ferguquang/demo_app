import 'package:flutter/material.dart';
import 'package:workflow_manager/base/network/api_caller.dart';
import 'package:workflow_manager/base/network/app_url.dart';
import 'package:workflow_manager/base/utils/base_sharepreference.dart';
import 'package:workflow_manager/storage/models/response/get_list_doctype_response.dart';
import 'package:workflow_manager/storage/models/response/get_list_record_type_response.dart';

class SearchStorageAdvanceRepository extends ChangeNotifier {
  List<RecordTypes> recordTypes = [], docTypes = [];

  bool isExpandRecordType = true;
  bool isExpandDocType = false;

  Future<void> getRecordTypes() async {
    var jsonRecordType = await ApiCaller.instance.get(AppUrl.getListRecordType,);

    try {
      GetListRecordTypeResponse response = GetListRecordTypeResponse.fromJson(jsonRecordType);
      recordTypes = response.data.recordTypes;

      var jsonDocType = await ApiCaller.instance.get(AppUrl.getListDocType);
      GetListDocTypeResponse responseDocType = GetListDocTypeResponse.fromJson(jsonDocType);
      docTypes = responseDocType.data.stgDocTypes;
      notifyListeners();
    } catch (e) {
      print("object");
    }
  }

  void setExpandRecordType() {
    isExpandRecordType = !isExpandRecordType;
    notifyListeners();
  }

  void setExpandDocType() {
    isExpandDocType = !isExpandDocType;
    notifyListeners();
  }
}