import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../helper/common.dart';
import '/business_logic/cubits/cubits.dart';

import 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription _connectivitySS;

  //Constructor
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    _connectivitySS =
        connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  //Stream Subscription listener method
  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      var isConnected =
          await checkConnection(); // check have internet access or not
      if (isConnected) {
        emitInternetConnection();
      } else {
        emitNotAccessible();
      }
    } else {
      emitNoInternetConnection();
    }
  }

  //No Internt Connection
  void emitNoInternetConnection() => emit(InternetDisconneted());

  //Internt Connection
  void emitInternetConnection() => emit(InternetConnected());

  //Internt not Accessible
  void emitNotAccessible() => emit(InternetNotAccessible());

  //Close stream
  @override
  Future<void> close() {
    _connectivitySS.cancel();
    return super.close();
  }
}
