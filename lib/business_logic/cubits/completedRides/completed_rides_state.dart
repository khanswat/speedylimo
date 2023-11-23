import 'package:equatable/equatable.dart';
import 'package:speedylimo/data/models/model.dart';

class CompletedRidesState extends Equatable {
  const CompletedRidesState();

  @override
  List<Object> get props => [];
}

class CompletedRidesInitial extends CompletedRidesState {}

class CompletedRidesError extends CompletedRidesState {
  final String message;
  CompletedRidesError(this.message);
}

class CompletedRidesLoaded extends CompletedRidesState {
  final List<CompletedRidesData> completedRidesData;
  CompletedRidesLoaded(this.completedRidesData);
  @override
  List<Object> get props => [completedRidesData];
}
