class GetAllProjects {
  String? status;
  String? resultCount;
  String? currentPage;
  String? firstbtn;
  int? prev;
  String? page1;
  String? page2;
  String? page3;
  String? page4;
  int? next;
  String? last;
  List<Data>? data;

  GetAllProjects(
      {this.status,
      this.resultCount,
      this.currentPage,
      this.firstbtn,
      this.prev,
      this.page1,
      this.page2,
      this.page3,
      this.page4,
      this.next,
      this.last,
      this.data});

  GetAllProjects.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    resultCount = json['resultCount'];
    currentPage = json['currentPage'];
    firstbtn = json['firstbtn'];
    prev = json['prev'];
    page1 = json['page1'];
    page2 = json['page2'];
    page3 = json['page3'];
    page4 = json['page4'];
    next = json['next'];
    last = json['last'];
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
    data['resultCount'] = resultCount;
    data['currentPage'] = currentPage;
    data['firstbtn'] = firstbtn;
    data['prev'] = prev;
    data['page1'] = page1;
    data['page2'] = page2;
    data['page3'] = page3;
    data['page4'] = page4;
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
  String? userId;
  String? projectName;
  String? address;
  String? city;
  String? projectStatus;
  String? createdOn;

  Data(
      {this.slNo,
      this.id,
      this.userId,
      this.projectName,
      this.address,
      this.city,
      this.projectStatus,
      this.createdOn});

  Data.fromJson(Map<String, dynamic> json) {
    slNo = json['sl_no'];
    id = json['id'];
    userId = json['user_id'];
    projectName = json['project_name'];
    address = json['address'];
    city = json['city'];
    projectStatus = json['project_status'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sl_no'] = slNo;
    data['id'] = id;
    data['user_id'] = userId;
    data['project_name'] = projectName;
    data['address'] = address;
    data['city'] = city;
    data['project_status'] = projectStatus;
    data['created_on'] = createdOn;
    return data;
  }
}
