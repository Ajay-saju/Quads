class GetAllProjects {
  String? status;
  List<Data>? data;

  GetAllProjects({this.status, this.data});

  GetAllProjects.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
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
  String? projectName;
  String? address;
  String? city;
  String? createdOn;

  Data(
      {this.slNo,
      this.id,
      this.userId,
      this.projectName,
      this.address,
      this.city,
      this.createdOn});

  Data.fromJson(Map<String, dynamic> json) {
    slNo = json['sl_no'];
    id = json['id'];
    userId = json['user_id'];
    projectName = json['project_name'];
    address = json['address'];
    city = json['city'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['sl_no'] = slNo;
    data['id'] = id;
    data['user_id'] = userId;
    data['project_name'] = projectName;
    data['address'] = address;
    data['city'] = city;
    data['created_on'] = createdOn;
    return data;
  }
}