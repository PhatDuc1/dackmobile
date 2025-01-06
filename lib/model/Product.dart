class Product {
  bool? success;
  String? message;
  List<Result>? result;

  Product({this.success, this.message, this.result});

  Product.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      result = <Result>[];
      json['data'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (result != null) {
      data['data'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? ten;
  String? hinhanh;
  String? daodien;
  String? dienvien;
  String? thoiluong;
  String? ngonngu;
  String? theloaiid;
  String? mota;

  Result(
      {this.id,
      this.ten,
      this.hinhanh,
      this.daodien,
      this.dienvien,
      this.thoiluong,
      this.ngonngu,
      this.theloaiid,
      this.mota});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ten = json['ten'];
    hinhanh = json['hinhanh'];
    daodien = json['daodien'];
    dienvien = json['dienvien'];
    thoiluong = json['thoiluong'];
    ngonngu = json['ngonngu'];
    theloaiid = json['theloaiid'];
    mota = json['mota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ten'] = ten;
    data['hinhanh'] = hinhanh;
    data['daodien'] = daodien;
    data['dienvien'] = dienvien;
    data['thoiluong'] = thoiluong;
    data['ngonngu'] = ngonngu;
    data['theloaiid'] = theloaiid;
    data['mota'] = mota;
    return data;
  }
}
