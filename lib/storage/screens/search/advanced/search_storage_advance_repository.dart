import 'package:flutter/material.dart';
import 'package:workflow_manager/base/network/api_caller.dart';
import 'package:workflow_manager/base/network/app_url.dart';
import 'package:workflow_manager/base/utils/base_sharepreference.dart';
import 'package:workflow_manager/storage/models/response/get_list_record_type_response.dart';

class SearchStorageAdvanceRepository extends ChangeNotifier {
  List<RecordTypes> recordTypes = [];

  Future<void> getRecordTypes() async {
    var json = await ApiCaller.instance.get(AppUrl.getListRecordType,);

    try {
      GetListRecordTypeResponse response = GetListRecordTypeResponse.fromJson(json);
      recordTypes = response.data.recordTypes;
      notifyListeners();
    } catch (e) {
      print("object");
    }

  }
}