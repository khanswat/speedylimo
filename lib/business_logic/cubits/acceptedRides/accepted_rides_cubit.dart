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
        emit(AcceptedRidesLoaded(res.data ?? []));
      } else {
        emit(AcceptedRidesError(res.message ?? ''));
      }
    } catch (e) {
      emit(AcceptedRidesError(''));
    }
  }
}
