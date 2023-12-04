import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../data/data.dart';
import '../../../services/services.dart';
import '../cubits.dart';

class PriceCubit extends Cubit<PriceState> {
  PriceCubit() : super(PriceInitial());
  var context = NavigationService.instance.navigatorKey.currentContext!;

  Future getPrice({required miles}) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      final body = {
        'miles': miles,
      };

      final resData = await UserRepository.instance.getPrice(body: body);
      if (resData.status == 200) {
        context.read<UserCubit>().updatePrice(resData);
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            errorMessage: resData.message));
      } else {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: resData.message));
      }
    } on DioError catch (e) {
      emit(state.copyWith(
          errorMessage: e.response?.statusCode == 500
              ? e.response?.statusMessage
              : e.response?.data['message'].toString(),
          status: FormzStatus.submissionFailure));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
