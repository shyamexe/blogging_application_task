import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogging_application/logic/status_indux_cubit/status_index_cubit.dart';
import 'package:equatable/equatable.dart';

class StatusTimerState extends Equatable {
  double timer;
   StatusTimerState({required this.timer});

  @override
  List<Object> get props => [timer];
}

class StatusTimerCubit extends Cubit<StatusTimerState> {

  StatusTimerCubit() : super(StatusTimerState(timer: 0));

  startTimer(){

    late Timer _timer;

    state.timer=0;

    const oneSec = Duration(seconds: 1);

    _timer=Timer.periodic(oneSec*.5, (Timer) { 

      if(state.timer <= 1){
        print(state.timer);
        emit(StatusTimerState(timer: state.timer+0.1));
      }else{
        _timer.cancel();
      }
    });
    
  }
}
