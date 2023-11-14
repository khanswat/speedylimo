import 'dart:convert';

BudgetSummaryModel budgetSummaryModelFromMap(String str) =>
    BudgetSummaryModel.fromMap(json.decode(str));

String budgetSummaryModelToMap(BudgetSummaryModel data) =>
    json.encode(data.toMap());

class BudgetSummaryModel {
  BudgetSummaryModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? status;
  final int? statusCode;
  final String? message;
  final List<BudgetComparisonData>? data;

  BudgetSummaryModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    List<BudgetComparisonData>? data,
  }) =>
      BudgetSummaryModel(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BudgetSummaryModel.fromMap(Map<String, dynamic> json) =>
      BudgetSummaryModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: List<BudgetComparisonData>.from(
            json['data'].map((x) => BudgetComparisonData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class BudgetComparisonData {
  BudgetComparisonData({
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

  BudgetComparisonData copyWith({
    dynamic monthRevenue,
    dynamic monthBudget,
    dynamic monthIncrseDecrese,
    dynamic monthIncdecAge,
    dynamic yearRevenue,
    dynamic yearBudget,
    dynamic yearIncrseDecrese,
    dynamic yearIncdecAge,
  }) =>
      BudgetComparisonData(
        monthRevenue: monthRevenue ?? this.monthRevenue,
        monthBudget: monthBudget ?? this.monthBudget,
        monthIncrseDecrese: monthIncrseDecrese ?? this.monthIncrseDecrese,
        monthIncdecAge: monthIncdecAge ?? this.monthIncdecAge,
        yearRevenue: yearRevenue ?? this.yearRevenue,
        yearBudget: yearBudget ?? this.yearBudget,
        yearIncrseDecrese: yearIncrseDecrese ?? this.yearIncrseDecrese,
        yearIncdecAge: yearIncdecAge ?? this.yearIncdecAge,
      );

  factory BudgetComparisonData.fromMap(Map<String, dynamic> json) =>
      BudgetComparisonData(
        monthRevenue: json['month_revenue'].toDouble(),
        monthBudget: json['month_budget'],
        monthIncrseDecrese: json['month_incrse_decrese'],
        monthIncdecAge: json['month_incdec_%age'],
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
