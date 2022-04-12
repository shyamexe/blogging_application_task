import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class NavigationBarState extends Equatable {
  int pageNumber;
   NavigationBarState({required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(NavigationBarState(pageNumber: 0));

  changeIndex(int index){
    emit(NavigationBarState(pageNumber: index));
  }
}
