import 'package:equatable/equatable.dart';
import 'package:speedylimo/data/data.dart';

class BooknowState extends Equatable {
  BooknowState();

  @override
  List<Object> get props => [];
}

class BookNowInitial extends BooknowState {}

class BookNowError extends BooknowState {
  final String message;
  BookNowError(this.message);
}

class BookNowLoaded extends BooknowState {
  final BooknowData booknowData;

  BookNowLoaded(this.booknowData);
  @override
  List<Object> get props => [booknowData];
}

class BookNowLoading extends BooknowState {}
