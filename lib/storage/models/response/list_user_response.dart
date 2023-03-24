import 'package:workflow_manager/base/models/base_response.dart';

class ListUserResponse extends BaseResponse {
  Data data;

  ListUserResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }
}

class Data {
  List<Categories> categories;

  Data({this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }
}

class Categories {
  int iD;
  String name;
  Attribute attribute;

  bool isSelected = false;

  Categories({this.iD, this.name, this.attribute});

  Categories.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    attribute = json['Attribute'] != null
        ? new Attribute.fromJson(json['Attribute'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    if (this.attribute != null) {
      data['Attribute'] = this.attribute.toJson();
    }
    return data;
  }
}

class Attribute {
  int iDDept;
  int iDPosition;
  String deptName;
  String positionName;
  int age;
  String gender;
  String phone;
  String address;
  String birthplace;
  String view;
  String update;
  String delete;
  String download;
  String copy;
  String move;
  String create;
  String share;

  Attribute(
      {this.iDDept,
        this.iDPosition,
        this.deptName,
        this.positionName,
        this.age,
        this.gender,
        this.phone,
        this.address,
        this.birthplace,
        this.view,
        this.update,
        this.delete,
        this.download,
        this.copy,
        this.move,
        this.create,
        this.share});

  Attribute.fromJson(Map<String, dynamic> json) {
    iDDept = json['IDDept'];
    iDPosition = json['IDPosition'];
    deptName = json['DeptName'];
    positionName = json['PositionName'];
    age = json['Age'];
    gender = json['Gender'];
    phone = json['Phone'];
    address = json['Address'];
    birthplace = json['Birthplace'];
    view = json['View'];
    update = json['Update'];
    delete = json['Delete'];
    download = json['Download'];
    copy = json['Copy'];
    move = json['Move'];
    create = json['Create'];
    share = json['Share'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDDept'] = this.iDDept;
    data['IDPosition'] = this.iDPosition;
    data['DeptName'] = this.deptName;
    data['PositionName'] = this.positionName;
    data['Age'] = this.age;
    data['Gender'] = this.gender;
    data['Phone'] = this.phone;
    data['Address'] = this.address;
    data['Birthplace'] = this.birthplace;
    data['View'] = this.view;
    data['Update'] = this.update;
    data['Delete'] = this.delete;
    data['Download'] = this.download;
    data['Copy'] = this.copy;
    data['Move'] = this.move;
    data['Create'] = this.create;
    data['Share'] = this.share;
    return data;
  }
}
