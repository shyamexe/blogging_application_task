import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class StatusIndexState extends Equatable {
  int index;
  StatusIndexState({required this.index});
  
  @override
  List<Object> get props => [index];
}
//this cubit holds the curren stats indux

class StatusIndexCubit extends Cubit<StatusIndexState> {
  StatusIndexCubit() : super(StatusIndexState(index: 0));

  updateStatus(){
    emit(StatusIndexState(index: state.index+1));
  }//this function update the indux value
}
