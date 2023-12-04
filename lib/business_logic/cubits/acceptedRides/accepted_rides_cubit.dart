import 'package:bloc/bloc.dart';

import '../../../data/data.dart';
import '../cubits.dart';

class AcceptedRidesCubit extends Cubit<AcceptedRidesState> {
  AcceptedRidesCubit() : super(AcceptedRidesInitial());

  Future getAcceptedRideList() async {
    try {
      emit(AcceptedRidesInitial());
      final res = await UserRepository.instance.getAcceptedRides();

      if (res.status == 200 && res.data != null) {
        emit(AcceptedRidesLoaded(res.data ?? [], null));
      } else {
        emit(AcceptedRidesError(res.message ?? ''));
      }
    } catch (e) {
      emit(AcceptedRidesError(''));
    }
  }

  Future getPassengerAccept({required rideID}) async {
    try {
      final body = {
        'ride_id': rideID,
      };
      emit(AcceptedRidesInitial());
      final res = await UserRepository.instance.postAccept(body: body);

      if (res.status == 200) {
        emit(PassengerAcceptLoaded(completedModel: res));
      } else {
        emit(PassengerAcceptError(res.message ?? ''));
      }
    } catch (e) {
      emit(PassengerAcceptError(''));
    }
  }

  Future getPassengerCancel({required rideID}) async {
    try {
      final body = {
        'ride_id': rideID,
      };
      emit(AcceptedRidesInitial());
      final res = await UserRepository.instance.postcancel(body: body);

      if (res.status == 200) {
        emit(PassengerCancelLoaded(cancelModel: res));
      } else {
        emit(PassengerCancelError(res.message ?? ''));
      }
    } catch (e) {
      emit(PassengerCancelError(''));
    }
  }

  Future getPassengerComplete({required rideID}) async {
    try {
      final body = {
        'ride_id': rideID,
      };
      emit(AcceptedRidesInitial());
      final res = await UserRepository.instance.postComplete(body: body);

      if (res.status == 200) {
        emit(PassengerCompleteLoaded(completeModel: res));
      } else {
        emit(PassengerCompleteError(res.message ?? ''));
      }
    } catch (e) {
      emit(PassengerCompleteError(''));
    }
  }
}
