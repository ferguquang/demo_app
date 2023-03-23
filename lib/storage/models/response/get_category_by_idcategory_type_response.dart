import 'package:workflow_manager/base/models/base_response.dart';

class GetCategoryByIDCategoryTypeResponse extends BaseResponse {
  Data data;

  GetCategoryByIDCategoryTypeResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }
}

class Data {
  List<Category> category;

  Data({this.category});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Category'] != null) {
      category = <Category>[];
      json['Category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['Category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int iD;
  String name;
  String code;

  Category({this.iD, this.name, this.code});

  Category.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Code'] = this.code;
    return data;
  }
}
