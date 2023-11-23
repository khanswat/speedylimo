import 'package:equatable/equatable.dart';
import '/data/models/model.dart';

class MyRidesState extends Equatable {
  const MyRidesState();

  @override
  List<Object> get props => [];
}

class MyRidesInitial extends MyRidesState {}

class MyRidesError extends MyRidesState {
  final String message;
  MyRidesError(this.message);
}

class MyRidesLoaded extends MyRidesState {
  final List<MyRidesData> myRidesData;
  MyRidesLoaded(this.myRidesData);
  @override
  List<Object> get props => [myRidesData];
}
