class GetAllUsers {
  String? status;
  List<Data>? data;

  GetAllUsers({this.status, this.data});

  GetAllUsers.fromJson(Map<String, dynamic> json) {
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
  String? fullName;
  String? email;
  String? phone;
  String? accType;

  Data(
      {this.slNo,
      this.id,
      this.fullName,
      this.email,
      this.phone,
      this.accType});

  Data.fromJson(Map<String, dynamic> json) {
    slNo = json['sl_no'];
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    accType = json['acc_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sl_no'] = slNo;
    data['id'] = id;
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['acc_type'] = accType;
    return data;
  }
}