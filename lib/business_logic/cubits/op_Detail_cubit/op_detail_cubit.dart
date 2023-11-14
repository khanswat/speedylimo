// import 'package:bloc/bloc.dart';

// import '../../../data/data.dart';
// import '../cubits.dart';

// class OpDetailCubit extends Cubit<OpDetailState> {
//   OpDetailCubit() : super(OpDetailInitial());

//   Future getOpDetailList(dynamic day, String month) async {
//     try {
//       emit(OpDetailInitial());
//       final res = await UserRepository.instance
//           .getRevenueDetailData(day: day, month: month);

//       if (res.status == true && res.data != null) {
//         emit(OpDetailLoaded(res.data ?? []));
//       } else {
//         emit(OpDetailError(res.message ?? ''));
//       }
//     } catch (e) {
//       emit(OpDetailError(''));
//     }
//   }

//   double getTotalsum(List<OpDetaildata> abc) {
//     double total_sum = 0;

//     abc.forEach((element) {
//       dynamic service3 = element.op ?? [];
//       total_sum += service3 ?? 0.0;
//     });
//     return total_sum;
//   }
// }
