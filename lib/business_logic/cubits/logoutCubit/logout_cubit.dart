import 'package:bloc/bloc.dart';
import '../cubits.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  // Future getlogout() async {
  //   try {
  //     emit(LogoutInitial());
  //     final res = await UserRepository.instance.getlogout();

  //     if (res.status == true && res.data != null) {
  //       emit(LogoutLoaded(res));
  //     } else {
  //       emit(LogoutError(res.message ?? ''));
  //     }
  //   } catch (e) {
  //     emit(LogoutError(''));
  //   }
  // }
}
