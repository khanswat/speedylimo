import 'package:equatable/equatable.dart';
import '/data/data.dart';

class UserManagementState extends Equatable {
  const UserManagementState();

  @override
  List<Object> get props => [];
}

class UserManagementInitial extends UserManagementState {}

class UserManagementError extends UserManagementState {
  final String message;
  UserManagementError(this.message);
}

class UserManagementLoaded extends UserManagementState {
  final List<AdminDriverData> adminDriverData;
  final List<AdminPassengerData> adminPassengerData;
  UserManagementLoaded(this.adminDriverData, this.adminPassengerData);
  @override
  List<Object> get props => [adminDriverData];
}

class DeleteLoading extends UserManagementState {}

class DeleteLoaded extends UserManagementState {
  final DeleteModel deleteModel;
  DeleteLoaded({required this.deleteModel});
}

class DeleteError extends UserManagementState {
  final message;
  DeleteError(this.message);
}
