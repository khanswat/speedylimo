class MonthlyModel {
  bool? status;
  int? statusCode;
  String? message;
  List<MonthlyData>? data;

  MonthlyModel({this.status, this.statusCode, this.message, this.data});

  MonthlyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MonthlyData>[];
      json['data'].forEach((v) {
        data!.add(new MonthlyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthlyData {
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

  MonthlyData(
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

  MonthlyData.fromJson(Map<String, dynamic> json) {
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
    final data = new Map<String, dynamic>();
    data['curr_ip_revenue'] = currIpRevenue;
    data['curr_op_revenue'] = currOpRevenue;
    data['curr_total_revenue'] = currTotalRevenue;
    data['last_op_revenue'] = lastOpRevenue;
    data['last_ip_revenue'] = lastIpRevenue;
    data['last_total_revenue'] = lastTotalRevenue;
    data['op_incrse_decrese'] = opIncrseDecrese;
    data['op_incdec_perage'] = opIncdecPerage;
    data['ip_incrse_decrese'] = ipIncrseDecrese;
    data['ip_incdec_perage'] = ipIncdecPerage;
    data['total_incrse_decrese'] = totalIncrseDecrese;
    data['total_incdec_perage'] = totalIncdecPerage;
    return data;
  }
}
