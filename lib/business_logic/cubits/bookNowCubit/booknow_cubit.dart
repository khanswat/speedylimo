import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:formz/formz.dart';

import '../../../data/data.dart';
import '../../../services/services.dart';
import '../cubits.dart';

class BooknowCubit extends Cubit<BooknowState> {
  BooknowCubit() : super(BookNowInitial());
  var context = NavigationService.instance.navigatorKey.currentContext!;

  Future PostBookNow(
      {required calendar,
      required pickuptime,
      required bags,
      required passenger,
      required bookingType,
      required as_directed,
      required time,
      required pickuplocation,
      required dropoffLocation,
      required totaltripTime,
      required miles,
      required amount,
      required instruction,
      required paymentID,
      required latlng}) async {
    try {
      final body = {
        'calendar': calendar,
        'pickup_time': pickuptime,
        'passenger': passenger,
        'bags': bags,
        'booking_type': bookingType,
        'as_directed': as_directed,
        'time': time,
        'pickup_location': pickuplocation,
        'dropoff_location': dropoffLocation,
        'total_trip_time_': totaltripTime,
        'total_trip_miles_': miles,
        'total_trip_amount_': amount,
        'special_instruction': instruction,
        'lat_long': latlng,
        'payment_id': paymentID
      };

      final resData = await UserRepository.instance.PostBookNow(body: body);
      if (resData.status == 200) {
        emit(BookNowLoaded(resData.data!));
      } else {
        emit(BookNowError(resData.message ?? ''));
      }
    } catch (e) {
      emit(BookNowError(''));
    }
  }
}
