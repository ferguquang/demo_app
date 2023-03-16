// class GetListRecordTypeResponse {
//   int? status;
//   Data? data;
//   List<Messages>? messages;
//
//   GetListRecordTypeResponse({this.status, this.data, this.messages});
//
//   GetListRecordTypeResponse.fromJson(Map<String, dynamic> json) {
//     status = json['Status'];
//     data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
//     if (json['Messages'] != null) {
//       messages = <Messages>[];
//       json['Messages'].forEach((v) {
//         messages!.add(new Messages.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Status'] = this.status;
//     if (this.data != null) {
//       data['Data'] = this.data!.toJson();
//     }
//     if (this.messages != null) {
//       data['Messages'] = this.messages!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   List<RecordTypes>? recordTypes;
//
//   Data({this.recordTypes});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['RecordTypes'] != null) {
//       recordTypes = <RecordTypes>[];
//       json['RecordTypes'].forEach((v) {
//         recordTypes!.add(new RecordTypes.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.recordTypes != null) {
//       data['RecordTypes'] = this.recordTypes!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class RecordTypes {
//   int? iD;
//   int? iDChannel;
//   String? name;
//   String? code;
//   String? describe;
//   String? format;
//   bool? isDefault;
//   int? parent;
//   String? parents;
//   int? fileCount;
//   int? pCTFileCount;
//   int? totalFileCount;
//   int? sizeSum;
//   int? pCTSizeSum;
//   int? totalSizeSum;
//   String? searchMeta;
//   bool? keepConnectionAlive;
//   Null? connection;
//   Null? lastSQL;
//   Null? lastArgs;
//   String? lastCommand;
//   bool? enableAutoSelect;
//   bool? enableNamedParams;
//   int? commandTimeout;
//   int? oneTimeCommandTimeout;
//
//   RecordTypes(
//       {this.iD,
//         this.iDChannel,
//         this.name,
//         this.code,
//         this.describe,
//         this.format,
//         this.isDefault,
//         this.parent,
//         this.parents,
//         this.fileCount,
//         this.pCTFileCount,
//         this.totalFileCount,
//         this.sizeSum,
//         this.pCTSizeSum,
//         this.totalSizeSum,
//         this.searchMeta,
//         this.keepConnectionAlive,
//         this.connection,
//         this.lastSQL,
//         this.lastArgs,
//         this.lastCommand,
//         this.enableAutoSelect,
//         this.enableNamedParams,
//         this.commandTimeout,
//         this.oneTimeCommandTimeout});
//
//   RecordTypes.fromJson(Map<String, dynamic> json) {
//     iD = json['ID'];
//     iDChannel = json['IDChannel'];
//     name = json['Name'];
//     code = json['Code'];
//     describe = json['Describe'];
//     format = json['Format'];
//     isDefault = json['IsDefault'];
//     parent = json['Parent'];
//     parents = json['Parents'];
//     fileCount = json['FileCount'];
//     pCTFileCount = json['PCTFileCount'];
//     totalFileCount = json['TotalFileCount'];
//     sizeSum = json['SizeSum'];
//     pCTSizeSum = json['PCTSizeSum'];
//     totalSizeSum = json['TotalSizeSum'];
//     searchMeta = json['SearchMeta'];
//     keepConnectionAlive = json['KeepConnectionAlive'];
//     connection = json['Connection'];
//     lastSQL = json['LastSQL'];
//     lastArgs = json['LastArgs'];
//     lastCommand = json['LastCommand'];
//     enableAutoSelect = json['EnableAutoSelect'];
//     enableNamedParams = json['EnableNamedParams'];
//     commandTimeout = json['CommandTimeout'];
//     oneTimeCommandTimeout = json['OneTimeCommandTimeout'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ID'] = this.iD;
//     data['IDChannel'] = this.iDChannel;
//     data['Name'] = this.name;
//     data['Code'] = this.code;
//     data['Describe'] = this.describe;
//     data['Format'] = this.format;
//     data['IsDefault'] = this.isDefault;
//     data['Parent'] = this.parent;
//     data['Parents'] = this.parents;
//     data['FileCount'] = this.fileCount;
//     data['PCTFileCount'] = this.pCTFileCount;
//     data['TotalFileCount'] = this.totalFileCount;
//     data['SizeSum'] = this.sizeSum;
//     data['PCTSizeSum'] = this.pCTSizeSum;
//     data['TotalSizeSum'] = this.totalSizeSum;
//     data['SearchMeta'] = this.searchMeta;
//     data['KeepConnectionAlive'] = this.keepConnectionAlive;
//     data['Connection'] = this.connection;
//     data['LastSQL'] = this.lastSQL;
//     data['LastArgs'] = this.lastArgs;
//     data['LastCommand'] = this.lastCommand;
//     data['EnableAutoSelect'] = this.enableAutoSelect;
//     data['EnableNamedParams'] = this.enableNamedParams;
//     data['CommandTimeout'] = this.commandTimeout;
//     data['OneTimeCommandTimeout'] = this.oneTimeCommandTimeout;
//     return data;
//   }
// }
//
// class Messages {
//   int? code;
//   String? text;
//
//   Messages({this.code, this.text});
//
//   Messages.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     text = json['text'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['text'] = this.text;
//     return data;
//   }
// }
