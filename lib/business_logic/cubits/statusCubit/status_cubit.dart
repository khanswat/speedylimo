import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data.dart';
import '../../../services/services.dart';
import '../cubits.dart';

class StatusCubit extends Cubit<StatusState> {
  StatusCubit() : super(StatusInitial());

  var context = NavigationService.instance.navigatorKey.currentContext!;

  Future getStatus() async {
    try {
      emit(StatusInitial());
      final res = await UserRepository.instance.getStatus();

      if (res.status == 200) {
        emit(StatusLoaded(statusModel: res));
        context.read<UserCubit>().stausDriver(res.message);
      } else {
        emit(StatusError(res.message ?? ''));
      }
    } catch (e) {
      emit(StatusError(''));
    }
  }
}
