class DoneSharedResponse {
  int status;
  Data data;
  List<String> messages;

  DoneSharedResponse({this.status, this.data, this.messages});

  DoneSharedResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    messages = json['Messages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    data['Messages'] = this.messages;
    return data;
  }
}

class Data {
  bool success;

  Data({this.success});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}
