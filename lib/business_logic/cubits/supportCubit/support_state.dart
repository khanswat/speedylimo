import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../data/data.dart';

class SupportState extends Equatable {
  const SupportState({
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.supportModel,
  });

  final FormzStatus status;

  final String? errorMessage;
  final SupportModel? supportModel;

  @override
  List<Object> get props => [
        status,
      ];

  SupportState copyWith({
    FormzStatus? status,
    String? errorMessage,
    SupportModel? supportModel,
  }) {
    return SupportState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        supportModel: supportModel ?? this.supportModel);
  }
}
