part of 'add_post_bloc.dart';

sealed class AddPostEvent extends Equatable {
  const AddPostEvent();

  @override
  List<Object> get props => [];
}

class AddPostInitialEvent extends AddPostEvent {}

class AddPostButtonPressed extends AddPostEvent {
  final Post post;

  const AddPostButtonPressed({required this.post});

  @override
  List<Object> get props => [post];
}
