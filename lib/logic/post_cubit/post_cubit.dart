import 'package:bloc/bloc.dart';
import 'package:blogging_application/data/data_providers/api_provider.dart';
import 'package:blogging_application/data/models/post_response_model.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
 
   PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  PostResponseModel posts;
  PostLoaded( {required this.posts});

  @override
  List<Object> get props => [posts];
}

class Postfailure extends PostState {
  String? error;
  Postfailure({this.error});

   @override
  List<Object> get props => [error??""];
}

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial()){
    getPost();
  }

  getPost()async{
    emit(PostLoading());

    try {
      emit(PostLoaded(posts: await ApiProvider().getPosts()));
    } catch (e) {
      emit(Postfailure(error: e.toString()));
    }
  }
}
