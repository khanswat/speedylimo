import '/data/data.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'user.cubit.dart';

class UserCubit extends Cubit<UserState> with HydratedMixin {
  UserCubit() : super(UserInitial());
  // var context = NavigationService.instance.navigatorKey.currentContext!;
  SharedPrefs _sharedPrefs = SharedPrefs();

  void updateName(var updatename) {
    emit(state.copyWith(update_name: updatename));
  }

  void updateEmail(var updatemail) {
    emit(state.copyWith(update_email: updatemail));
  }

  void logout() async {
    await _sharedPrefs.deleteToken();
    emit(state.copyWithLogout(
      user: null,
    ));
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toMap();
  }
}
