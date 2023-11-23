import 'package:equatable/equatable.dart';
import 'package:speedylimo/data/models/model.dart';

class CancelRideState extends Equatable {
  const CancelRideState();

  @override
  List<Object> get props => [];
}

class CancelRideInitial extends CancelRideState {}

class CancelRidesError extends CancelRideState {
  final String message;
  CancelRidesError(this.message);
}

class CancelRidesLoaded extends CancelRideState {
  final List<CancelRideData> cancelRidesData;
  CancelRidesLoaded(this.cancelRidesData);
  @override
  List<Object> get props => [cancelRidesData];
}
