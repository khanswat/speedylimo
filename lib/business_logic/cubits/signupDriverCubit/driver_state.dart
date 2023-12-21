abstract class RegisterDriverState {}

class RegisterDriverInitial extends RegisterDriverState {}

class RegisterDriverInProgress extends RegisterDriverState {
  final double progress;
  RegisterDriverInProgress({required this.progress});
}

class RegisterDriverSuccess extends RegisterDriverState {
  final String message;

  RegisterDriverSuccess(this.message);
}

class RegisterDriverFailure extends RegisterDriverState {
  final String error;

  RegisterDriverFailure(this.error);
}
