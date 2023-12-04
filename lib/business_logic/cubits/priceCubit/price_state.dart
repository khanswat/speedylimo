import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../data/data.dart';

class PriceState extends Equatable {
  PriceState({
    this.status = FormzStatus.pure,
    this.ridepriceModel,
    this.errorMessage,
  });

  final FormzStatus status;

  final PriceModel? ridepriceModel;
  final String? errorMessage;
  // final String? relation;

  @override
  List<Object?> get props => [status, errorMessage];
  PriceState copyWith({
    FormzStatus? status,
    String? errorMessage,
    PriceModel? ridepriceModel,
  }) {
    return PriceState(
        status: status ?? this.status,
        ridepriceModel: ridepriceModel ?? this.ridepriceModel,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

class PriceInitial extends PriceState {}
