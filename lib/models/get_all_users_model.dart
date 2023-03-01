class GetAllUsers {
  String? status;
  String? resultCount;
  String? currentPage;
  String? firstbtn;
  int? prev;
  String? page1;
  String? page2;
  String? page3;
  int? next;
  String? last;
  List<Data>? data;

  GetAllUsers(
      {this.status,
      this.resultCount,
      this.currentPage,
      this.firstbtn,
      this.prev,
      this.page1,
      this.page2,
      this.page3,
      this.next,
      this.last,
      this.data});

  GetAllUsers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resultCount = json['resultCount'];
    currentPage = json['currentPage'];
    firstbtn = json['firstbtn'];
    prev = json['prev'];
    page1 = json['page1'];
    page2 = json['page2'];
    page3 = json['page3'];
    next = json['next'];
    last = json['last'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['resultCount'] = resultCount;
    data['currentPage'] = currentPage;
    data['firstbtn'] = firstbtn;
    data['prev'] = prev;
    data['page1'] = page1;
    data['page2'] = page2;
    data['page3'] = page3;
    data['next'] = next;
    data['last'] = last;
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
