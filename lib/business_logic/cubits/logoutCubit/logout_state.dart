import 'package:equatable/equatable.dart';

import '../../../data/data.dart';

class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutError extends LogoutState {
  final String message;
  LogoutError(this.message);
}

class LogoutLoaded extends LogoutState {
  final LogoutModel opdetaildata;
  LogoutLoaded(this.opdetaildata);
  @override
  List<Object> get props => [opdetaildata];
}
