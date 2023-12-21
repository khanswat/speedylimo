import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '/data/data.dart';

class EditProfileState extends Equatable {
  EditProfileState({
    this.user,
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.imageString,
  });
  final ProfileModel? user;
  final FormzStatus status;

  final String? errorMessage;

  final String? imageString;

  @override
  List<Object?> get props => [
        user,
        status,
        imageString,
      ];

  EditProfileState copyWith({
    FormzStatus? status,
    String? errorMessage,
    String? imageString,
    ProfileModel? user,
  }) {
    return EditProfileState(
        status: status ?? this.status,
        imageString: this.imageString,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

class EditProfileInitial extends EditProfileState {
  EditProfileInitial() : super();
}
