part of 'list_post_bloc.dart';

sealed class ListPostEvent extends Equatable {
  const ListPostEvent();

  @override
  List<Object> get props => [];
}

class FetchListPostEvent extends ListPostEvent {}
