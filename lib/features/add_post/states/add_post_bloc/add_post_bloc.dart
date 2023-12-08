import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:theme_data_ex/data/models/post_model.dart';
import 'package:theme_data_ex/data/services/database_service.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {

  final DatabaseService databaseService = DatabaseService.instance;

  AddPostBloc() : super(AddPostInitialState()) {
    on<AddPostEvent>((event, emit) async {
      
      if(event is AddPostInitialEvent) {
        emit(AddPostInitialState());
      }
      
      if(event is AddPostButtonPressed) {
        try {
          Post post = event.post;

          await databaseService.insertPost(post);
          emit(AddPostSuccessState());
        } catch (e) {
          emit(const AddPostErrorState(message: 'Error while adding'));
        }
      }
    });
  }
}
