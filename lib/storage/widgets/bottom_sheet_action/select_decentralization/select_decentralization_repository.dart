import 'package:flutter/material.dart';

class SelectDecentralizationRepository extends ChangeNotifier {
  List<DecentralizationModel> listDecentralization = [];
  bool isAllDecentralization = false;

  bool isAdditional = false, isRemove = false;

  void getListDecentralization() {
    listDecentralization.add(DecentralizationModel(
      label: "Thêm"
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Sửa"
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Xóa"
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Tạo"
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Sao chép"
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Tải về"
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Di chuyển"
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Phân quyền"
    ));

    notifyListeners();
  }

  void setAllDecentralization() {
    isAllDecentralization = !isAllDecentralization;

    listDecentralization.forEach((element) {
      element.isActive = isAllDecentralization;
    });

    notifyListeners();
  }

  updateItem(DecentralizationModel model) {
    listDecentralization[listDecentralization.indexWhere((element) => element.label == model.label)] = model;
    notifyListeners();
  }

  updateIsAdditional(bool value) {
    isAdditional = value;
    notifyListeners();
  }

  updateIsRemove(bool value) {
    isRemove = value;
    notifyListeners();
  }
}

class DecentralizationModel {
  String label;
  bool isActive = false;

  DecentralizationModel({this.label, this.isActive = false});
}