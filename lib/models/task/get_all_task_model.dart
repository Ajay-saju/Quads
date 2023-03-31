class GetAllTaskModel {
  String? status;
  String? resultCount;
  String? currentPage;
  String? firstbtn;
  int? prev;
  String? page1;
  String? next;
  String? last;
  List<Data>? data;

  GetAllTaskModel(
      {this.status,
      this.resultCount,
      this.currentPage,
      this.firstbtn,
      this.prev,
      this.page1,
      this.next,
      this.last,
      this.data});

  GetAllTaskModel.fromJson(Map<String, dynamic> json) {
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
  String? taskId;
  String? description;
  String? starts;
  String? ends;
  String? status;
  String? taggedUser;
  int? timeLeft;
  String? enable;

  Data(
      {this.slNo,
      this.taskId,
      this.description,
      this.starts,
      this.ends,
      this.status,
      this.taggedUser,
      this.timeLeft,
      this.enable});

  Data.fromJson(Map<String, dynamic> json) {
    slNo = json['sl_no'];
    taskId = json['task_id'];
    description = json['description'];
    starts = json['starts'];
    ends = json['ends'];
    status = json['status'];
    taggedUser = json['tagged_user'];
    timeLeft = json['time_left'];
    enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sl_no'] = this.slNo;
    data['task_id'] = this.taskId;
    data['description'] = this.description;
    data['starts'] = this.starts;
    data['ends'] = this.ends;
    data['status'] = this.status;
    data['tagged_user'] = this.taggedUser;
    data['time_left'] = this.timeLeft;
    data['enable'] = this.enable;
    return data;
  }
}