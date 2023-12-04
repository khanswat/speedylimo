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
  final CompletedModel? completedModel;
  AcceptedRidesLoaded(this.acceptedRidesData, this.completedModel);
  @override
  List<Object> get props => [acceptedRidesData];
}

class PassengerAcceptLoading extends AcceptedRidesState {}

class PassengerAcceptLoaded extends AcceptedRidesState {
  final CompletedModel completedModel;
  PassengerAcceptLoaded({required this.completedModel});
}

class PassengerAcceptError extends AcceptedRidesState {
  final message;
  PassengerAcceptError(this.message);
}

class PassengerCancelLoading extends AcceptedRidesState {}

class PassengerCancelLoaded extends AcceptedRidesState {
  final CancelModel cancelModel;
  PassengerCancelLoaded({required this.cancelModel});
}

class PassengerCancelError extends AcceptedRidesState {
  final message;
  PassengerCancelError(this.message);
}

class PassengerCompleteLoading extends AcceptedRidesState {}

class PassengerCompleteLoaded extends AcceptedRidesState {
  final CompleteModel completeModel;
  PassengerCompleteLoaded({required this.completeModel});
}

class PassengerCompleteError extends AcceptedRidesState {
  final message;
  PassengerCompleteError(this.message);
}
