import 'package:bloc/bloc.dart';

import '../../../data/data.dart';
import '../cubits.dart';

class BookingQueriesCubit extends Cubit<BookingQueriesState> {
  BookingQueriesCubit() : super(BookingQueriesInitial());

  Future getBookingQueriesList() async {
    try {
      emit(BookingQueriesInitial());
      final res = await UserRepository.instance.getBookingQueries();

      if (res.status == 200 && res.data != null) {
        emit(BookingQueriesLoaded(res.data ?? []));
      } else {
        emit(BookingQueriesError(res.message ?? ''));
      }
    } catch (e) {
      emit(BookingQueriesError(''));
    }
  }
}
