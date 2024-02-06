import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { InitialState, LostState, GainedState }

class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;
  InternetCubit() : super(InternetState.InitialState) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.GainedState);
      } else {
        emit(InternetState.LostState);
      }
    });
  }
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
