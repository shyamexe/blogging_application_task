import 'package:bloc/bloc.dart';
import 'package:blogging_application/data/data_providers/api_provider.dart';
import 'package:blogging_application/data/models/post_content_model.dart';
import 'package:equatable/equatable.dart';

class PostContentState extends Equatable {
  const PostContentState();

  @override
  List<Object> get props => [];
}

class PostContentInitial extends PostContentState {}

class PostContentLoading extends PostContentState {}

class PostContentLoaded extends PostContentState {
  PostContentModel postData;
  PostContentLoaded({required this.postData});
   @override
  List<Object> get props => [postData];
}

class PostContentFailure extends PostContentState {}

class PostContentCubit extends Cubit<PostContentState> {
  PostContentCubit() : super(PostContentInitial());

  getPostContent(String url)async{
    emit(PostContentLoading());

    try {
      emit(PostContentLoaded(postData: await ApiProvider().getContent(url)));
    } catch (e) {
      emit(PostContentFailure());
    }
  }
}
