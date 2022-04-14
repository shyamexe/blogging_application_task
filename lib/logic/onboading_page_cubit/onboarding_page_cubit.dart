import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class OnboardingPageState extends Equatable {
  int pageNo;
   OnboardingPageState({required this.pageNo});

  @override
  List<Object> get props => [pageNo];
}


class OnboardingPageCubit extends Cubit<OnboardingPageState> {
  OnboardingPageCubit() : super(OnboardingPageState(pageNo: 0));

  onNext(){
    print(state.pageNo);
    emit(OnboardingPageState(pageNo: state.pageNo+1));
    
  }
}
