import 'package:equatable/equatable.dart';

import '../../../data/data.dart';

class AcceptedRidesState extends Equatable {
  const AcceptedRidesState();

  @override
  List<Object> get props => [];
}

class AcceptedRidesInitial extends AcceptedRidesState {}

class AcceptedRidesError extends AcceptedRidesState {
  final String message;
  AcceptedRidesError(this.message);
}

class AcceptedRidesLoaded extends AcceptedRidesState {
  final List<AcceptedRidesData> acceptedRidesData;
  AcceptedRidesLoaded(this.acceptedRidesData);
  @override
  List<Object> get props => [acceptedRidesData];
}
