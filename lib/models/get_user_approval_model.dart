class GetUserApprovalModel {
  String? status;
  List<Data>? data;

  GetUserApprovalModel({this.status, this.data});

  GetUserApprovalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? slNo;
  String? id;
  String? userId;
  String? projectId;
  String? material;
  String? quantity;
  String? caption;
  String? adminApproval;
  String? addedOn;

  Data(
      {this.slNo,
      this.id,
      this.userId,
      this.projectId,
      this.material,
      this.quantity,
      this.caption,
      this.adminApproval,
      this.addedOn});

  Data.fromJson(Map<String, dynamic> json) {
    slNo = json['sl_no'];
    id = json['id'];
    userId = json['user_id'];
    projectId = json['project_id'];
    material = json['material'];
    quantity = json['quantity'];
    caption = json['caption'];
    adminApproval = json['admin_approval'];
    addedOn = json['added_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sl_no'] = slNo;
    data['id'] = id;
    data['user_id'] = userId;
    data['project_id'] = projectId;
    data['material'] = material;
    data['quantity'] = quantity;
    data['caption'] = caption;
    data['admin_approval'] = adminApproval;
    data['added_on'] = addedOn;
    return data;
  }
}
