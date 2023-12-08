part of 'add_post_bloc.dart';

sealed class AddPostState extends Equatable {
  const AddPostState();
  
  @override
  List<Object> get props => [];
}

final class AddPostInitialState extends AddPostState {}

class LoadingAddPostState extends AddPostState {}

class AddPostSuccessState extends AddPostState {}

class AddPostErrorState extends AddPostState {
  final String message;
  const AddPostErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
