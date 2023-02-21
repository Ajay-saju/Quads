class UserSignin {
  String? status;
  String? message;
  Data? data;

  UserSignin({this.status, this.message, this.data});

  UserSignin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? fullName;
  String? email;
  String? password;
  String? phoneNo;
  String? accType;
  String? verified;
  String? projectId;
  String? createdOn;

  Data(
      {this.id,
      this.fullName,
      this.email,
      this.password,
      this.phoneNo,
      this.accType,
      this.verified,
      this.projectId,
      this.createdOn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    password = json['password'];
    phoneNo = json['phone_no'];
    accType = json['acc_type'];
    verified = json['verified'];
    projectId = json['project_id'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['phone_no'] = phoneNo;
    data['acc_type'] = accType;
    data['verified'] = verified;
    data['project_id'] = projectId;
    data['created_on'] = createdOn;
    return data;
  }
}