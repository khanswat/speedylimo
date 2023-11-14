class YearlyModel {
  bool? status;
  int? statusCode;
  String? message;
  List<YearlyData>? data;

  YearlyModel({this.status, this.statusCode, this.message, this.data});

  YearlyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <YearlyData>[];
      json['data'].forEach((v) {
        data!.add(new YearlyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class YearlyData {
  dynamic currIpRevenue;
  dynamic currTotalRevenue;
  dynamic currOpRevenue;
  dynamic lastOpRevenue;
  dynamic lastIpRevenue;
  dynamic lastTotalRevenue;
  dynamic opIncrseDecrese;
  dynamic opIncdecPerage;
  dynamic ipIncrseDecrese;
  dynamic ipIncdecPerage;
  dynamic totalIncrseDecrese;
  dynamic totalIncdecPerage;

  YearlyData(
      {this.currIpRevenue,
      this.currTotalRevenue,
      this.lastOpRevenue,
      this.currOpRevenue,
      this.lastIpRevenue,
      this.lastTotalRevenue,
      this.opIncrseDecrese,
      this.opIncdecPerage,
      this.ipIncrseDecrese,
      this.ipIncdecPerage,
      this.totalIncrseDecrese,
      this.totalIncdecPerage});

  YearlyData.fromJson(Map<String, dynamic> json) {
    currIpRevenue = json['curr_ip_revenue'];
    currOpRevenue = json['curr_op_revenue'];
    currTotalRevenue = json['curr_total_revenue'];
    lastOpRevenue = json['last_op_revenue'];
    lastIpRevenue = json['last_ip_revenue'];
    lastTotalRevenue = json['last_total_revenue'];
    opIncrseDecrese = json['op_incrse_decrese'];
    opIncdecPerage = json['op_incdec_perage'];
    ipIncrseDecrese = json['ip_incrse_decrese'];
    ipIncdecPerage = json['ip_incdec_perage'];
    totalIncrseDecrese = json['total_incrse_decrese'];
    totalIncdecPerage = json['total_incdec_perage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curr_ip_revenue'] = this.currIpRevenue;
    data['curr_op_revenue'] = this.currOpRevenue;
    data['curr_total_revenue'] = this.currTotalRevenue;
    data['last_op_revenue'] = this.lastOpRevenue;
    data['last_ip_revenue'] = this.lastIpRevenue;
    data['last_total_revenue'] = this.lastTotalRevenue;
    data['op_incrse_decrese'] = this.opIncrseDecrese;
    data['op_incdec_perage'] = this.opIncdecPerage;
    data['ip_incrse_decrese'] = this.ipIncrseDecrese;
    data['ip_incdec_perage'] = this.ipIncdecPerage;
    data['total_incrse_decrese'] = this.totalIncrseDecrese;
    data['total_incdec_perage'] = this.totalIncdecPerage;
    return data;
  }
}
