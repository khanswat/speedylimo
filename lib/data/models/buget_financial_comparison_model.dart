// To parse this JSON data, do
//
//     final finanicalBudgetModel = finanicalBudgetModelFromMap(jsonString);

import 'dart:convert';

FinanicalBudgetModel finanicalBudgetModelFromMap(String str) =>
    FinanicalBudgetModel.fromMap(json.decode(str));

String finanicalBudgetModelToMap(FinanicalBudgetModel data) =>
    json.encode(data.toMap());

class FinanicalBudgetModel {
  FinanicalBudgetModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? status;
  final int? statusCode;
  final String? message;
  final List<FinancialData>? data;

  FinanicalBudgetModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    List<FinancialData>? data,
  }) =>
      FinanicalBudgetModel(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory FinanicalBudgetModel.fromMap(Map<String, dynamic> json) =>
      FinanicalBudgetModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: List<FinancialData>.from(
            json['data'].map((x) => FinancialData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class FinancialData {
  FinancialData({
    this.monthRevenue,
    this.monthBudget,
    this.monthIncrseDecrese,
    this.monthIncdecAge,
    this.yearRevenue,
    this.yearBudget,
    this.yearIncrseDecrese,
    this.yearIncdecAge,
  });

  final dynamic monthRevenue;
  final dynamic monthBudget;
  final dynamic monthIncrseDecrese;
  final dynamic monthIncdecAge;
  final dynamic yearRevenue;
  final dynamic yearBudget;
  final dynamic yearIncrseDecrese;
  final dynamic yearIncdecAge;

  FinancialData copyWith({
    dynamic monthRevenue,
    dynamic monthBudget,
    dynamic monthIncrseDecrese,
    dynamic monthIncdecAge,
    dynamic yearRevenue,
    dynamic yearBudget,
    dynamic yearIncrseDecrese,
    dynamic yearIncdecAge,
  }) =>
      FinancialData(
        monthRevenue: monthRevenue ?? this.monthRevenue,
        monthBudget: monthBudget ?? this.monthBudget,
        monthIncrseDecrese: monthIncrseDecrese ?? this.monthIncrseDecrese,
        monthIncdecAge: monthIncdecAge ?? this.monthIncdecAge,
        yearRevenue: yearRevenue ?? this.yearRevenue,
        yearBudget: yearBudget ?? this.yearBudget,
        yearIncrseDecrese: yearIncrseDecrese ?? this.yearIncrseDecrese,
        yearIncdecAge: yearIncdecAge ?? this.yearIncdecAge,
      );

  factory FinancialData.fromMap(Map<String, dynamic> json) => FinancialData(
        monthRevenue: json['month_revenue'].toDouble(),
        monthBudget: json['month_budget'].toDouble(),
        monthIncrseDecrese: json['month_incrse_decrese'].toDouble(),
        monthIncdecAge: json['month_incdec_%age'].toDouble(),
        yearRevenue: json['year_revenue'].toDouble(),
        yearBudget: json['year_budget'].toDouble(),
        yearIncrseDecrese: json['year_incrse_decrese'].toDouble(),
        yearIncdecAge: json['year_incdec_%age'].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'month_revenue': monthRevenue,
        'month_budget': monthBudget,
        'month_incrse_decrese': monthIncrseDecrese,
        'month_incdec_%age': monthIncdecAge,
        'year_revenue': yearRevenue,
        'year_budget': yearBudget,
        'year_incrse_decrese': yearIncrseDecrese,
        'year_incdec_%age': yearIncdecAge,
      };
}
