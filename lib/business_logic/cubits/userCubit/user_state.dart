import 'dart:convert';

import 'package:equatable/equatable.dart';

import '/data/data.dart';

class UserState extends Equatable {
  UserState({this.update_name, this.update_email});

  final String? update_name;
  final String? update_email;

  @override
  List<Object?> get props => [update_name, update_email];

  UserState copyWith({String? update_name, String? update_email}) {
    return UserState(
        update_name: update_name ?? this.update_name,
        update_email: update_email ?? this.update_email);
  }

  UserState copyWithLogout({
    UserData? user,
  }) {
    return UserState();
  }

  Map<String, dynamic> toMap() {
    return {
      'update_name': update_name,
      'update_email': update_email,
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      update_name: map['update_name'],
      update_email: map['update_email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserState.fromJson(String source) =>
      UserState.fromMap(json.decode(source));
}

class UserError extends UserState {}

class UserInitial extends UserState {}
