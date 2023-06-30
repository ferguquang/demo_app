import 'package:workflow_manager/base/models/base_response.dart';

class StgFileShareResponse extends BaseResponse {
  Data data;

  StgFileShareResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }
}

class Data {
  Stgdoc stgdoc;
  StgDocSharePublic stgDocSharePublic;
  // List<StgDocShareUsers> stgDocShareUsers;
  // List<StgDocShareUsers> stgDocShareDepts;
  // List<StgDocShareUsers> stgDocShareTeams;

  int typeStgdocShare;

  Data(
      {this.stgdoc,
        this.stgDocSharePublic,
        // this.stgDocShareUsers,
        // this.stgDocShareDepts,
        // this.stgDocShareTeams
      });

  Data.fromJson(Map<String, dynamic> json) {
    stgdoc =
    json['Stgdoc'] != null ? new Stgdoc.fromJson(json['Stgdoc']) : null;
    stgDocSharePublic = json['StgDocSharePublic'] != null ?
         new StgDocSharePublic.fromJson(json['StgDocSharePublic'])
        : null;
    // if (json['StgDocShareUsers'] != null) {
    //   stgDocShareUsers = <StgDocShareUsers>[];
    //   json['StgDocShareUsers'].forEach((v) {
    //     stgDocShareUsers.add(new StgDocShareUsers.fromJson(v, 1));
    //   });
    // }
    // if (json['StgDocShareDepts'] != null) {
    //   stgDocShareDepts = <StgDocShareUsers>[];
    //   json['StgDocShareDepts'].forEach((v) {
    //     stgDocShareDepts.add(new StgDocShareUsers.fromJson(v, 2));
    //   });
    // }
    // if (json['StgDocShareTeams'] != null) {
    //   stgDocShareTeams = <StgDocShareUsers>[];
    //   json['StgDocShareTeams'].forEach((v) {
    //     stgDocShareTeams.add(new StgDocShareUsers.fromJson(v, 3));
    //   });
    // }
  }
}

class Stgdoc {
  int iDSoHoa;
  int iD;
  int iDChannel;
  int iDCategory;
  int iDOcrForm;
  int iDDoctype;
  int iDLanguage;
  int iDDept;
  int iDReplace;
  int iDWarehouse;
  int iDRecordType;
  int type;
  String name;
  String describe;
  int size;
  String created;

  Stgdoc(
      {this.iDSoHoa,
        this.iD,
        this.iDChannel,
        this.iDCategory,
        this.iDOcrForm,
        this.iDDoctype,
        this.iDLanguage,
        this.iDDept,
        this.iDReplace,
        this.iDWarehouse,
        this.iDRecordType,
        this.type,
        this.name,
        this.describe,
        this.size,
        this.created});

  Stgdoc.fromJson(Map<String, dynamic> json) {
    iDSoHoa = json['IDSoHoa'];
    iD = json['ID'];
    iDChannel = json['IDChannel'];
    iDCategory = json['IDCategory'];
    iDOcrForm = json['IDOcrForm'];
    iDDoctype = json['IDDoctype'];
    iDLanguage = json['IDLanguage'];
    iDDept = json['IDDept'];
    iDReplace = json['IDReplace'];
    iDWarehouse = json['IDWarehouse'];
    iDRecordType = json['IDRecordType'];
    type = json['Type'];
    name = json['Name'];
    describe = json['Describe'];
    size = json['Size'];
    created = json['Created'];
  }
}
class StgDocSharePublic {
  int iDPublic;
  String iDUser;
  String iDDept;
  String iDTeam;
  bool isCreate;
  bool isView;
  bool isUpdate;
  bool isDelete;
  bool isShare;
  bool isDownload;
  bool isCopy;
  bool isMove;

  StgDocSharePublic(
      {this.iDPublic,
        this.iDUser,
        this.iDDept,
        this.iDTeam,
        this.isCreate,
        this.isView,
        this.isUpdate,
        this.isDelete,
        this.isShare,
        this.isDownload,
        this.isCopy,
        this.isMove});

  StgDocSharePublic.fromJson(Map<String, dynamic> json) {
    iDPublic = json['IDPublic'];
    iDUser = json['IDUser'];
    iDDept = json['IDDept'];
    iDTeam = json['IDTeam'];
    isCreate = json['IsCreate'];
    isView = json['IsView'];
    isUpdate = json['IsUpdate'];
    isDelete = json['IsDelete'];
    isShare = json['IsShare'];
    isDownload = json['IsDownload'];
    isCopy = json['IsCopy'];
    isMove = json['IsMove'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDPublic'] = this.iDPublic;
    data['IDUser'] = this.iDUser;
    data['IDDept'] = this.iDDept;
    data['IDTeam'] = this.iDTeam;
    data['IsCreate'] = this.isCreate;
    data['IsView'] = this.isView;
    data['IsUpdate'] = this.isUpdate;
    data['IsDelete'] = this.isDelete;
    data['IsShare'] = this.isShare;
    data['IsDownload'] = this.isDownload;
    data['IsCopy'] = this.isCopy;
    data['IsMove'] = this.isMove;
    return data;
  }
}

class StgDocShareUsers {
  int iDUserOrDeptOrTeam;
  int iD;
  int iDDoc;
  int ownedBy;
  String created;
  bool isView;
  bool isUpdate;
  bool isDelete;
  bool isDownload;
  bool isCopy;
  bool isMove;
  bool isCreate;
  bool isShare;

  StgDocShareUsers(
      {this.iDUserOrDeptOrTeam,
        this.iD,
        this.iDDoc,
        this.ownedBy,
        this.created,
        this.isView,
        this.isUpdate,
        this.isDelete,
        this.isDownload,
        this.isCopy,
        this.isMove,
        this.isCreate,
        this.isShare});

  StgDocShareUsers.fromJson(Map<String, dynamic> json, int typeStgdocShare) {
    if (typeStgdocShare == 1) {
      iDUserOrDeptOrTeam = json['IDUser'];
    } else if (typeStgdocShare == 2) {
      iDUserOrDeptOrTeam = json['IDDept'];
    } else {
      iDUserOrDeptOrTeam = json['IDTeam'];
    }
    iD = json['ID'];
    iDDoc = json['IDDoc'];
    ownedBy = json['OwnedBy'];
    created = json['Created'];
    isView = json['IsView'];
    isUpdate = json['IsUpdate'];
    isDelete = json['IsDelete'];
    isDownload = json['IsDownload'];
    isCopy = json['IsCopy'];
    isMove = json['IsMove'];
    isCreate = json['IsCreate'];
    isShare = json['IsShare'];
  }
}