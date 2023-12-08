part of 'list_post_bloc.dart';

sealed class ListPostState extends Equatable {
  const ListPostState();
  
  @override
  List<Object> get props => [];
}

final class ListPostInitialState extends ListPostState {}

class LoadingListPostsState extends ListPostState {}

class ListPostsSuccesState extends ListPostState {
  final List<Post> posts;

  const ListPostsSuccesState({required this.posts});

  @override
  List<Object> get props => [posts];  
}

class ListPostsErrorState extends ListPostState {
  final String message;

  const ListPostsErrorState({ required this.message});

  @override
  List<Object> get props => [message];
}
