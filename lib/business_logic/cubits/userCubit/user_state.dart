// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../presentation/app/app.dart';
import '/data/data.dart';

class UserState extends Equatable {
  UserState(
      {this.update_name,
      this.priceModel,
      this.email,
      this.phoneNo,
      this.userData,
      this.username,
      this.pickResult,
      this.statusDriver,
      this.paymentID,
      this.photo});

  final String? update_name;

  final String? phoneNo;
  final String? username;
  final String? statusDriver;
  final PriceModel? priceModel;
  final String? paymentID;
  var photo;
  final UserData? userData;
  final PickResult? pickResult;
  final String? email;

  @override
  List<Object?> get props => [
        update_name,
        priceModel,
        photo,
        email,
        username,
        phoneNo,
        userData,
        pickResult,
        statusDriver,
        paymentID
      ];

  UserState copyWith(
      {String? update_name,
      PriceModel? priceModel,
      String? username,
      String? phoneNo,
      String? paymentID,
      dynamic fromLocation,
      dynamic toLocation,
      UserData? userData,
      PickResult? pickResult,
      String? statusDriver,
      var photo,
      String? email}) {
    return UserState(
        update_name: update_name ?? this.update_name,
        priceModel: priceModel ?? this.priceModel,
        photo: photo ?? this.photo,
        email: email ?? this.email,
        userData: userData ?? this.userData,
        phoneNo: phoneNo ?? this.phoneNo,
        username: username ?? this.username,
        statusDriver: statusDriver ?? this.statusDriver,
        pickResult: pickResult ?? this.pickResult,
        paymentID: paymentID ?? this.paymentID);
  }

  UserState copyWithLogout({
    UserData? userData,
  }) {
    return UserState(userData: this.userData);
  }

  Map<String, dynamic> toMap() {
    return {
      'update_name': update_name,
      'photo': photo,
      'email': email,
      'username': username,
      'phoneNo': phoneNo,
      'statusDriver': statusDriver,
      'user': userData?.toMap(),
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      update_name: map['update_name'],
      photo: map['photo'],
      email: map['email'],
      phoneNo: map['phoneNo'],
      username: map['username'],
      statusDriver: map['statusDriver'],
      userData: map['user'] != null ? UserData.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserState.fromJson(String source) =>
      UserState.fromMap(json.decode(source));
}

class UserError extends UserState {}

class UserInitial extends UserState {}
