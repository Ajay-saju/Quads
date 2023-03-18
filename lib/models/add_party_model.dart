class AddPartyModel {
  String? status;
  Data? data;

  AddPartyModel({this.status, this.data});

  AddPartyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? projectId;
  String? partyName;
  String? phoneNo;
  String? description;
  String? addedOn;

  Data(
      {this.id,
      this.userId,
      this.projectId,
      this.partyName,
      this.phoneNo,
      this.description,
      this.addedOn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    projectId = json['project_id'];
    partyName = json['party_name'];
    phoneNo = json['phone_no'];
    description = json['description'];
    addedOn = json['added_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['project_id'] = this.projectId;
    data['party_name'] = this.partyName;
    data['phone_no'] = this.phoneNo;
    data['description'] = this.description;
    data['added_on'] = this.addedOn;
    return data;
  }
}