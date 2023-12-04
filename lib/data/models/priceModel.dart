class PriceModel {
  int? status;
  String? message;
  var price;
  var miles;

  PriceModel({this.status, this.message, this.price, this.miles});

  PriceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    price = json['price'];
    miles = json['miles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['price'] = this.price;
    data['miles'] = this.miles;
    return data;
  }
}
