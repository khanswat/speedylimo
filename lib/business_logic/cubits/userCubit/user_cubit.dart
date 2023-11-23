import '/data/data.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'user.cubit.dart';

class UserCubit extends Cubit<UserState> with HydratedMixin {
  UserCubit() : super(UserInitial());

  final SharedPrefs _sharedPrefs = SharedPrefs();

  void updateUser(UserData userData) {
    emit(state.copyWith(userData: userData));
  }

  void myCurrentAddress(pickResult) {
    emit(state.copyWith(pickResult: pickResult));
  }

  void logout() async {
    await _sharedPrefs.deleteToken();
    emit(state.copyWithLogout(userData: null));
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
