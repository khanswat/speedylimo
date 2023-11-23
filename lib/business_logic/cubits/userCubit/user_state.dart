// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../presentation/app/app.dart';
import '/data/data.dart';

class UserState extends Equatable {
  UserState(
      {this.update_name,
      this.doctorId,
      this.designation,
      this.email,
      this.phoneNo,
      this.userData,
      this.username,
      this.pickResult,
      this.photo});

  final String? update_name;
  final String? doctorId;
  final String? designation;
  final String? phoneNo;
  final String? username;

  var photo;
  final UserData? userData;
  final PickResult? pickResult;

  final String? email;

  @override
  List<Object?> get props => [
        update_name,
        doctorId,
        designation,
        photo,
        email,
        username,
        phoneNo,
        userData,
        pickResult,
      ];

  UserState copyWith(
      {String? update_name,
      String? doctorId,
      String? designation,
      String? username,
      String? phoneNo,
      dynamic fromLocation,
      dynamic toLocation,
      UserData? userData,
      PickResult? pickResult,
      var photo,
      String? email}) {
    return UserState(
        update_name: update_name ?? this.update_name,
        designation: designation ?? this.designation,
        photo: photo ?? this.photo,
        email: email ?? this.email,
        userData: userData ?? this.userData,
        phoneNo: phoneNo ?? this.phoneNo,
        username: username ?? this.username,
        pickResult: pickResult ?? this.pickResult,
        doctorId: doctorId ?? this.doctorId);
  }

  UserState copyWithLogout({
    UserData? userData,
  }) {
    return UserState(userData: this.userData);
  }

  Map<String, dynamic> toMap() {
    return {
      'update_name': update_name,
      'doctor_Id': doctorId,
      'designation': designation,
      'photo': photo,
      'email': email,
      'username': username,
      'phoneNo': phoneNo,
      'user': userData?.toMap(),
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      update_name: map['update_name'],
      doctorId: map['doctor_Id'],
      designation: map['designation'],
      photo: map['photo'],
      email: map['email'],
      phoneNo: map['phoneNo'],
      username: map['username'],
      userData: map['user'] != null ? UserData.fromMap(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserState.fromJson(String source) =>
      UserState.fromMap(json.decode(source));
}

class UserError extends UserState {}

class UserInitial extends UserState {}
