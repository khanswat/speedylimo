import 'package:bloc/bloc.dart';

import '../../../data/data.dart';
import '../cubits.dart';

class CancelRideCubit extends Cubit<CancelRideState> {
  CancelRideCubit() : super(CancelRideInitial());

  Future getCancelRideList() async {
    try {
      emit(CancelRideInitial());
      final res = await UserRepository.instance.getCancelRides();

      if (res.status == 200 && res.data != null) {
        emit(CancelRidesLoaded(res.data ?? []));
      } else {
        emit(CancelRidesError(res.message ?? ''));
      }
    } catch (e) {
      emit(CancelRidesError(''));
    }
  }
}
