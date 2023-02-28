class GetDashBordModel {
  String? status;
  List<Data>? data;

  GetDashBordModel({this.status, this.data});

  GetDashBordModel.fromJson(Map<String, dynamic> json) {
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
  String? totalProjects;
  String? ongoingProjects;
  String? completedProjects;

  Data({this.totalProjects, this.ongoingProjects, this.completedProjects});

  Data.fromJson(Map<String, dynamic> json) {
    totalProjects = json['total_projects'];
    ongoingProjects = json['ongoing_projects'];
    completedProjects = json['completed_projects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_projects'] = totalProjects;
    data['ongoing_projects'] = ongoingProjects;
    data['completed_projects'] = completedProjects;
    return data;
  }
}
