import 'package:flutter/material.dart';
import 'package:workflow_manager/base/models/base_response.dart';

import 'get_category_by_idcategory_type_response.dart';

class GetRecordFieldSettingsByIDTypeResponse extends BaseResponse  {
  Data data;

  GetRecordFieldSettingsByIDTypeResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }
}

class Data {
  List<RecordFieldSettings> recordFieldSettings;

  Data({this.recordFieldSettings});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['RecordFieldSettings'] != null) {
      recordFieldSettings = <RecordFieldSettings>[];
      json['RecordFieldSettings'].forEach((v) {
        recordFieldSettings.add(new RecordFieldSettings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recordFieldSettings != null) {
      data['RecordFieldSettings'] =
          this.recordFieldSettings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecordFieldSettings {
  int iD;
  int iDType;
  int iDField;
  String name;
  String title;
  String datatype;
  int weight;
  bool isMulti;
  bool isSearch;
  bool isCatalog;

  String value = "";
  String textDisplay = ""; // áp dụng cho isCatalog = true
  TextEditingController textEditingController = TextEditingController();
  List<Category> listCategorySelected = [];

  RecordFieldSettings(
      {this.iD,
        this.iDType,
        this.iDField,
        this.name,
        this.title,
        this.weight,
        this.isMulti,
        this.isSearch,
        this.isCatalog,

        this.value = ""
      });

  RecordFieldSettings.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    iDType = json['IDType'];
    iDField = json['IDField'];
    name = json['Name'];
    title = json['Title'];
    datatype = json['Datatype'];
    weight = json['Weight'];
    isMulti = json['IsMulti'];
    isSearch = json['IsSearch'];
    isCatalog = json['IsCatalog'];

    textEditingController = TextEditingController();
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['IDType'] = this.iDType;
    data['IDField'] = this.iDField;
    data['Name'] = this.name;
    data['Title'] = this.title;
    data['Weight'] = this.weight;
    data['IsMulti'] = this.isMulti;
    data['IsSearch'] = this.isSearch;
    data['IsCatalog'] = this.isCatalog;
    // data['Connection'] = this.connection;
    // data['LastSQL'] = this.lastSQL;
    // data['LastArgs'] = this.lastArgs;
    return data;
  }
}
