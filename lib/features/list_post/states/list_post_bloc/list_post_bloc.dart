import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:theme_data_ex/data/models/post_model.dart';
import 'package:theme_data_ex/data/services/database_service.dart';
import 'package:theme_data_ex/features/add_post/states/add_post_bloc/add_post_bloc.dart';

part 'list_post_event.dart';
part 'list_post_state.dart';

class ListPostBloc extends Bloc<ListPostEvent, ListPostState> {

  final DatabaseService databaseService = DatabaseService.instance;
  final AddPostBloc addPostBloc;
  late StreamSubscription streamSubscription;

  ListPostBloc({required this.addPostBloc}) : super(ListPostInitialState()) {
    on<ListPostEvent>((event, emit) async {
      monitorAddPost();
      
      if(event is FetchListPostEvent) {
        
        emit(LoadingListPostsState());
        
        try {
          List<Post> posts = await databaseService.getPosts();
          emit(ListPostsSuccesState(posts: posts));
        } catch (e) {
          emit(const ListPostsErrorState(message: 'Error while loading'));
        }
      }
    });
  }

  void monitorAddPost() {
    streamSubscription = addPostBloc.stream.listen((state) async {
      if(state is AddPostSuccessState) {
        emit(LoadingListPostsState());
        List<Post> posts = await databaseService.getPosts();
        emit(ListPostsSuccesState(posts: posts));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
