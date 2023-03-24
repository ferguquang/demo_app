import 'package:flutter/material.dart';
import 'package:workflow_manager/base/network/api_caller.dart';
import 'package:workflow_manager/base/network/app_url.dart';
import 'package:workflow_manager/storage/models/response/list_user_response.dart';
import 'package:workflow_manager/storage/models/response/stgfile_share_response.dart';

class SelectDecentralizationRepository extends ChangeNotifier {
  List<DecentralizationModel> listDecentralization = [];
  bool isAllDecentralization = false;
  bool isAllUser = false;

  bool isAdditional = false, isRemove = false;
  List<Categories> deptList = [], teamList = [], accountUsers = [];
  StgFileShareResponse stgFileShareResponse;

  Future<void> getData({String idFile}) async {
    var jsonDeptList = await ApiCaller.instance.postFormData(AppUrl.deptGetList, {});
    var jsonTeamList = await ApiCaller.instance.postFormData(AppUrl.teamGetList, {});
    var jsonAccountUsers = await ApiCaller.instance.postFormData(AppUrl.accountUsers, {});
    ListUserResponse responseDeptList = ListUserResponse.fromJson(jsonDeptList);
    deptList = responseDeptList.data.categories;

    ListUserResponse responseTeamList = ListUserResponse.fromJson(jsonTeamList);
    teamList = responseTeamList.data.categories;

    ListUserResponse responseAccountUsers = ListUserResponse.fromJson(jsonAccountUsers);
    accountUsers = responseAccountUsers.data.categories;

    var jsonStgFileShare = await ApiCaller.instance.postFormData(
      AppUrl.stgFileShare,
      {
        "ID": idFile
      }
    );
    stgFileShareResponse = StgFileShareResponse.fromJson(jsonStgFileShare);

    getListDecentralization(stgFileShareResponse.data.stgDocSharePublic);

    notifyListeners();
  }

  void getListDecentralization(StgDocSharePublic stgDocSharePublic) {
    listDecentralization.add(DecentralizationModel(
      label: "Xem",
      isActive: stgDocSharePublic.isView
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Sửa",
        isActive: stgDocSharePublic.isUpdate
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Xóa",
        isActive: stgDocSharePublic.isDelete
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Tạo",
        isActive: stgDocSharePublic.isCreate
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Sao chép",
        isActive: stgDocSharePublic.isCopy
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Tải về",
        isActive: stgDocSharePublic.isDownload
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Di chuyển",
        isActive: stgDocSharePublic.isMove
    ));
    listDecentralization.add(DecentralizationModel(
        label: "Phân quyền",
        isActive: stgDocSharePublic.isShare
    ));

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