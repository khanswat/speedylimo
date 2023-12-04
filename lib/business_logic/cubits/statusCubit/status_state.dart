import 'package:equatable/equatable.dart';
import 'package:speedylimo/data/data.dart';

class StatusState extends Equatable {
  const StatusState();

  @override
  List<Object> get props => [];
}

class StatusInitial extends StatusState {}

class StatusLoaded extends StatusState {
  final StatusModel statusModel;
  StatusLoaded({required this.statusModel});
}

class StatusError extends StatusState {
  final message;
  StatusError(this.message);
}
