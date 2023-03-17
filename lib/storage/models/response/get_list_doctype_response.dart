import 'package:workflow_manager/base/models/base_response.dart';

class GetListDocTypeResponse extends BaseResponse {
  Data data;

  GetListDocTypeResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }
}

class Data {
  List<StgDocTypes> stgDocTypes;

  Data({this.stgDocTypes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['StgDocTypes'] != null) {
      stgDocTypes = <StgDocTypes>[];
      json['StgDocTypes'].forEach((v) {
        stgDocTypes.add(new StgDocTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stgDocTypes != null) {
      data['StgDocTypes'] = this.stgDocTypes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StgDocTypes {
  int iD;
  int iDChannel;
  String name;
  String code;
  String describe;
  bool isDefault;
  int parent;
  String parents;
  int fileCount;
  int pCTFileCount;
  int totalFileCount;
  int sizeSum;
  int pCTSizeSum;
  int totalSizeSum;
  String searchMeta;
  int iDDept;
  int iDWarehouse;
  int iDPreservationPeriod;
  int iDSecurityLevel;
  int weight;
  bool keepConnectionAlive;
  // Null? connection;
  // Null? lastSQL;
  // Null? lastArgs;
  String lastCommand;
  bool enableAutoSelect;
  bool enableNamedParams;
  int commandTimeout;
  int oneTimeCommandTimeout;

  StgDocTypes(
      {this.iD,
        this.iDChannel,
        this.name,
        this.code,
        this.describe,
        this.isDefault,
        this.parent,
        this.parents,
        this.fileCount,
        this.pCTFileCount,
        this.totalFileCount,
        this.sizeSum,
        this.pCTSizeSum,
        this.totalSizeSum,
        this.searchMeta,
        this.iDDept,
        this.iDWarehouse,
        this.iDPreservationPeriod,
        this.iDSecurityLevel,
        this.weight,
        this.keepConnectionAlive,
        // this.connection,
        // this.lastSQL,
        // this.lastArgs,
        this.lastCommand,
        this.enableAutoSelect,
        this.enableNamedParams,
        this.commandTimeout,
        this.oneTimeCommandTimeout});

  StgDocTypes.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    iDChannel = json['IDChannel'];
    name = json['Name'];
    code = json['Code'];
    describe = json['Describe'];
    isDefault = json['IsDefault'];
    parent = json['Parent'];
    parents = json['Parents'];
    fileCount = json['FileCount'];
    pCTFileCount = json['PCTFileCount'];
    totalFileCount = json['TotalFileCount'];
    sizeSum = json['SizeSum'];
    pCTSizeSum = json['PCTSizeSum'];
    totalSizeSum = json['TotalSizeSum'];
    searchMeta = json['SearchMeta'];
    iDDept = json['IDDept'];
    iDWarehouse = json['IDWarehouse'];
    iDPreservationPeriod = json['IDPreservationPeriod'];
    iDSecurityLevel = json['IDSecurityLevel'];
    weight = json['Weight'];
    keepConnectionAlive = json['KeepConnectionAlive'];
    // connection = json['Connection'];
    // lastSQL = json['LastSQL'];
    // lastArgs = json['LastArgs'];
    lastCommand = json['LastCommand'];
    enableAutoSelect = json['EnableAutoSelect'];
    enableNamedParams = json['EnableNamedParams'];
    commandTimeout = json['CommandTimeout'];
    oneTimeCommandTimeout = json['OneTimeCommandTimeout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['IDChannel'] = this.iDChannel;
    data['Name'] = this.name;
    data['Code'] = this.code;
    data['Describe'] = this.describe;
    data['IsDefault'] = this.isDefault;
    data['Parent'] = this.parent;
    data['Parents'] = this.parents;
    data['FileCount'] = this.fileCount;
    data['PCTFileCount'] = this.pCTFileCount;
    data['TotalFileCount'] = this.totalFileCount;
    data['SizeSum'] = this.sizeSum;
    data['PCTSizeSum'] = this.pCTSizeSum;
    data['TotalSizeSum'] = this.totalSizeSum;
    data['SearchMeta'] = this.searchMeta;
    data['IDDept'] = this.iDDept;
    data['IDWarehouse'] = this.iDWarehouse;
    data['IDPreservationPeriod'] = this.iDPreservationPeriod;
    data['IDSecurityLevel'] = this.iDSecurityLevel;
    data['Weight'] = this.weight;
    data['KeepConnectionAlive'] = this.keepConnectionAlive;
    // data['Connection'] = this.connection;
    // data['LastSQL'] = this.lastSQL;
    // data['LastArgs'] = this.lastArgs;
    data['LastCommand'] = this.lastCommand;
    data['EnableAutoSelect'] = this.enableAutoSelect;
    data['EnableNamedParams'] = this.enableNamedParams;
    data['CommandTimeout'] = this.commandTimeout;
    data['OneTimeCommandTimeout'] = this.oneTimeCommandTimeout;
    return data;
  }
}
