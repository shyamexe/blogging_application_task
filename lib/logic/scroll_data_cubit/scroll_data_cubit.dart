import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ScrollDataState extends Equatable {
  int index;
  ScrollDataState({required this.index});

  @override
  List<Object> get props => [index];
}

// class ScrollDataInitial extends ScrollDataState {}

class ScrollDataCubit extends Cubit<ScrollDataState> {
  ScrollDataCubit() : super(ScrollDataState(index: 0));
  

 
}
