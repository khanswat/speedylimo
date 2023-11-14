import 'dart:convert';

YearlyComparisonModel? YearlyComparisonModelFromMap(String str) =>
    YearlyComparisonModel.fromMap(json.decode(str));

String YearlyComparisonModelToMap(YearlyComparisonModel? data) =>
    json.encode(data!.toMap());

class YearlyComparisonModel {
  YearlyComparisonModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool? status;
  final int? statusCode;
  final String? message;
  final YearlyComparisonData? data;

  YearlyComparisonModel copyWith({
    bool? status,
    int? statusCode,
    String? message,
    YearlyComparisonData? data,
  }) =>
      YearlyComparisonModel(
        status: status ?? this.status,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory YearlyComparisonModel.fromMap(Map<String, dynamic> json) =>
      YearlyComparisonModel(
        status: json['status'],
        statusCode: json['statusCode'],
        message: json['message'],
        data: YearlyComparisonData.fromMap(json['data']),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'statusCode': statusCode,
        'message': message,
        'data': data!.toMap(),
      };
}

class YearlyComparisonData {
  YearlyComparisonData({
    this.firstHeading,
    this.secondHeading,
    this.thirdHeading,
    this.fourthHeading,
    this.firstValue,
    this.secondValue,
    this.diff1,
    this.diffAge1,
    this.thirdValue,
    this.fourthValue,
    this.diff2,
    this.diffAge2,
  });

  final String? firstHeading;
  final String? secondHeading;
  final String? thirdHeading;
  final String? fourthHeading;
  dynamic firstValue;
  dynamic secondValue;
  dynamic diff1;
  dynamic diffAge1;
  dynamic thirdValue;
  dynamic fourthValue;
  dynamic diff2;
  dynamic diffAge2;

  YearlyComparisonData copyWith({
    String? firstHeading,
    String? secondHeading,
    String? thirdHeading,
    String? fourthHeading,
    dynamic firstValue,
    dynamic secondValue,
    dynamic diff1,
    dynamic diffAge1,
    dynamic thirdValue,
    dynamic fourthValue,
    dynamic diff2,
    dynamic diffAge2,
  }) =>
      YearlyComparisonData(
        firstHeading: firstHeading ?? this.firstHeading,
        secondHeading: secondHeading ?? this.secondHeading,
        thirdHeading: thirdHeading ?? this.thirdHeading,
        fourthHeading: fourthHeading ?? this.fourthHeading,
        firstValue: firstValue ?? this.firstValue,
        secondValue: secondValue ?? this.secondValue,
        diff1: diff1 ?? this.diff1,
        diffAge1: diffAge1 ?? this.diffAge1,
        thirdValue: thirdValue ?? this.thirdValue,
        fourthValue: fourthValue ?? this.fourthValue,
        diff2: diff2 ?? this.diff2,
        diffAge2: diffAge2 ?? this.diffAge2,
      );

  factory YearlyComparisonData.fromMap(Map<String, dynamic> json) =>
      YearlyComparisonData(
        firstHeading: json['first_heading'],
        secondHeading: json['second_heading'],
        thirdHeading: json['third_heading'],
        fourthHeading: json['fourth_heading'],
        firstValue: json['first_value'],
        secondValue: json['second_value'],
        diff1: json['diff1'],
        diffAge1: json['diff_%age1'],
        thirdValue: json['third_value'],
        fourthValue: json['fourth_value'],
        diff2: json['diff2'],
        diffAge2: json['diff_%age2'],
      );

  Map<String, dynamic> toMap() => {
        'first_heading': firstHeading,
        'second_heading': secondHeading,
        'third_heading': thirdHeading,
        'fourth_heading': fourthHeading,
        'first_value': firstValue,
        'second_value': secondValue,
        'diff1': diff1,
        'diff_%age1': diffAge1,
        'third_value': thirdValue,
        'fourth_value': fourthValue,
        'diff2': diff2,
        'diff_%age2': diffAge2,
      };
}
