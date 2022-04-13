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
  StatusIndexCubit statusIndexCubit;
  StatusTimerCubit({required this.statusIndexCubit}) : super(StatusTimerState(timer: 0));

  startTimer(length){

    late Timer _timer;

    state.timer=0;

    const oneMili = Duration(milliseconds: 10);

    _timer=Timer.periodic(oneMili, (Timer) { 

      if(state.timer <= 1){
       print(state.timer);
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
  Future<void> close() async{
    
    return super.close();
  }
}
