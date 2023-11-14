import 'package:bloc/bloc.dart';

import '../../../data/data.dart';
import '../cubits.dart';

class IpDetailCubit extends Cubit<IpDetailState> {
  IpDetailCubit() : super(IpDetailInitial());

  Future getIpDetailList(dynamic day, String month) async {
    try {
      emit(IpDetailInitial());
      final res = await UserRepository.instance
          .getRevenueDetailData(day: day, month: month);

      if (res.status == true && res.data != null) {
        emit(IpDetailLoaded(res.data ?? []));
      } else {
        emit(IpDetailError(res.message ?? ''));
      }
    } catch (e) {
      emit(IpDetailError(''));
    }
  }

  double getTotalsum(List<OpDetaildata> abc) {
    double total_sum = 0;

    abc.forEach((element) {
      dynamic service3 = element.ip ?? [];
      total_sum += service3 ?? 0.0;
    });
    return total_sum;
  }
}
