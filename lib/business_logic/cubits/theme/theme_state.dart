import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/presentation/presentation.dart';

import '/utils/utils.dart';

class ThemeState extends Equatable {
  final bool isDark;
  final ThemeData themeData;
  final ThemeVariant variant;
  final bool isUrduEnable;
   ThemeState(
      {required this.isDark, required this.variant, required this.themeData, this.isUrduEnable = false});

  ThemeState copyWith({
    bool? isDark,
    ThemeData? themeData,
    ThemeVariant? variant,
    bool? isUrduEnable,
  }) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
      themeData: themeData ?? this.themeData,
      variant: variant ?? this.variant,
      isUrduEnable: isUrduEnable ?? this.isUrduEnable,
    );
  }

  @override
  List<Object?> get props => [isDark, themeData, variant,isUrduEnable];

  Map<String, dynamic> toMap() {
    return {
      'isDark': isDark,
      'variant': variant.index,
      'isUrduEnable': isUrduEnable,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      isDark: map['isDark'],
      isUrduEnable: map['isUrduEnable'],
      themeData: map['variant'] == 0
          ? themeVariantData[ThemeVariant.light]!
          : themeVariantData[ThemeVariant.dark]!,
      variant: map['variant'] == 0 ? ThemeVariant.light : ThemeVariant.dark,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeState.fromJson(String source) =>
      ThemeState.fromMap(json.decode(source));
}
