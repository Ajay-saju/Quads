class GetAllPartyModel {
  String? status;
  String? resultCount;
  String? currentPage;
  String? firstbtn;
  int? prev;
  String? page1;
  String? next;
  String? last;
  List<Data>? data;

  GetAllPartyModel(
      {this.status,
      this.resultCount,
      this.currentPage,
      this.firstbtn,
      this.prev,
      this.page1,
      this.next,
      this.last,
      this.data});

  GetAllPartyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resultCount = json['resultCount'];
    currentPage = json['currentPage'];
    firstbtn = json['firstbtn'];
    prev = json['prev'];
    page1 = json['page1'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['resultCount'] = this.resultCount;
    data['currentPage'] = this.currentPage;
    data['firstbtn'] = this.firstbtn;
    data['prev'] = this.prev;
    data['page1'] = this.page1;
    data['next'] = this.next;
    data['last'] = this.last;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? slNo;
  String? id;
  String? partyName;
  String? phoneNo;
  String? description;

  Data({this.slNo, this.id, this.partyName, this.phoneNo, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    slNo = json['sl_no'];
    id = json['id'];
    partyName = json['party_name'];
    phoneNo = json['phone_no'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sl_no'] = this.slNo;
    data['id'] = this.id;
    data['party_name'] = this.partyName;
    data['phone_no'] = this.phoneNo;
    data['description'] = this.description;
    return data;
  }
}