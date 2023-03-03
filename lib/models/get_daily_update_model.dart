class GetDailyUpdatesModel {
  String? status;
  List<Data>? data;

  GetDailyUpdatesModel({this.status, this.data});

  GetDailyUpdatesModel.fromJson(Map<String, dynamic> json) {
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
  List<Photos>? photos;
  String? caption;
  String? date;
  String? addedOn;
  String? msg;

  Data({this.photos, this.caption, this.date, this.addedOn, this.msg});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    caption = json['caption'];
    date = json['date'];
    addedOn = json['added_on'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    data['caption'] = caption;
    data['date'] = date;
    data['added_on'] = addedOn;
    data['msg'] = msg;
    return data;
  }
}

class Photos {
  String? img;

  Photos({this.img});

  Photos.fromJson(Map<String, dynamic> json) {
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = img;
    return data;
  }
}
