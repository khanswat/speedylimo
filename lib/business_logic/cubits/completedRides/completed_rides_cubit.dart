import 'package:bloc/bloc.dart';

import '../../../data/data.dart';
import '../cubits.dart';

class CompletedRidesCubit extends Cubit<CompletedRidesState> {
  CompletedRidesCubit() : super(CompletedRidesInitial());

  Future getCompletedRideList() async {
    try {
      emit(CompletedRidesInitial());
      final res = await UserRepository.instance.getCompletedRides();

      if (res.status == 200 && res.data != null) {
        emit(CompletedRidesLoaded(res.data ?? []));
      } else {
        emit(CompletedRidesError(res.message ?? ''));
      }
    } catch (e) {
      emit(CompletedRidesError(''));
    }
  }
}
