import 'package:bloc/bloc.dart';

import '../../../data/data.dart';
import '../cubits.dart';

class UserManagementCubit extends Cubit<UserManagementState> {
  UserManagementCubit() : super(UserManagementInitial());

  Future getDriverList() async {
    try {
      emit(UserManagementInitial());
      final res = await UserRepository.instance.getUserManagement();

      if (res.data != null) {
        emit(UserManagementLoaded(res.data ?? [], []));
      } else {
        emit(UserManagementError(res.message ?? ''));
      }
    } catch (e) {
      emit(UserManagementError(''));
    }
  }

  Future getPassengerList() async {
    try {
      emit(UserManagementInitial());
      final res = await UserRepository.instance.getUserManagementPassenger();

      if (res.data != null) {
        emit(UserManagementLoaded([], res.data ?? []));
      } else {
        emit(UserManagementError(res.message ?? ''));
      }
    } catch (e) {
      emit(UserManagementError(''));
    }
  }

  Future getUserDelete({required ID}) async {
    try {
      emit(UserManagementInitial());
      final res = await UserRepository.instance.getUserDelete(ID);

      if (res.status == 'success') {
        emit(DeleteLoaded(deleteModel: res));
      } else {
        emit(DeleteError(res.message ?? ''));
      }
    } catch (e) {
      emit(DeleteError(''));
    }
  }
}
