import 'package:bloc/bloc.dart';

import '../../../data/data.dart';
import '../cubits.dart';

class MyRidesCubit extends Cubit<MyRidesState> {
  MyRidesCubit() : super(MyRidesInitial());

  Future getMyRidesList() async {
    try {
      emit(MyRidesInitial());
      final res = await UserRepository.instance.getMyRides();

      if (res.status == 200 && res.data != null) {
        emit(MyRidesLoaded(res.data ?? []));
      } else {
        emit(MyRidesError(res.message ?? ''));
      }
    } catch (e) {
      emit(MyRidesError(''));
    }
  }

  Future getDriverAccept({required rideID}) async {
    try {
      final body = {
        'ride_id': rideID,
      };
      emit(MyRidesInitial());
      final res = await UserRepository.instance.postAccept(body: body);

      if (res.status == 200) {
        emit(DriverAcceptLoaded(completedModel: res));
      } else {
        emit(DriverAcceptError(res.message ?? ''));
      }
    } catch (e) {
      emit(DriverAcceptError(''));
    }
  }
}
