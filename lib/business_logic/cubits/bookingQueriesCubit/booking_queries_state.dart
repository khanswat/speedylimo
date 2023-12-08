import 'package:equatable/equatable.dart';

import '../../../data/data.dart';

class BookingQueriesState extends Equatable {
  const BookingQueriesState();

  @override
  List<Object> get props => [];
}

class BookingQueriesInitial extends BookingQueriesState {}

class BookingQueriesError extends BookingQueriesState {
  final String message;
  BookingQueriesError(this.message);
}

class BookingQueriesLoaded extends BookingQueriesState {
  final List<BookingQueryData> bookingqueryData;

  BookingQueriesLoaded(this.bookingqueryData);
  @override
  List<Object> get props => [bookingqueryData];
}
