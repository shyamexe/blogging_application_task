import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blogging_application/logic/status_indux_cubit/status_index_cubit.dart';
import 'package:equatable/equatable.dart';

class StatusTimerState extends Equatable {
  double timer;
   StatusTimerState({required this.timer});

  @override
  List<Object> get props => [timer];
}//timer cubit for story pogression

class StatusTimerCubit extends Cubit<StatusTimerState> {
  StatusIndexCubit statusIndexCubit;
  StatusTimerCubit({required this.statusIndexCubit}) : super(StatusTimerState(timer: 0));

  late Timer _timer;

  startTimer(length){

    

    state.timer=0;

    const oneMili = Duration(milliseconds: 10);

    _timer=Timer.periodic(oneMili, (Timer) { 

      if(state.timer < 1){
        emit(StatusTimerState(timer: state.timer+0.002));
      }else{
        if(length-1 != statusIndexCubit.state.index){
          statusIndexCubit.updateStatus();
          startTimer(length);
          }
        
       
        _timer.cancel();
      }
       
    });
    
  }

  @override
  Future<void> close() {
    
    _timer.cancel();
    return super.close();
  }
}
