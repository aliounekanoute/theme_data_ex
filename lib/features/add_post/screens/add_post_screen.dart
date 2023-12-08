
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_data_ex/data/controllers/add_post_controller.dart';
import 'package:theme_data_ex/data/models/post_model.dart';
import 'package:theme_data_ex/features/add_post/states/add_post_bloc/add_post_bloc.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  final _formKey = GlobalKey<FormState>();
  final AddPostController addPostController = AddPostController();

  @override
  void initState() {
    BlocProvider.of<AddPostBloc>(context).add(AddPostInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  BlocBuilder<AddPostBloc, AddPostState>(
                    builder: (context, state) {
                      if (state is AddPostErrorState) {
                        return messageText(message: state.message, type: 'error');
                      } else if(state is AddPostSuccessState) {
                        return messageText(message: 'Post added', type: 'success');
                      }

                      return Container();
                    },
                  ),
                  const SizedBox(height: 12,),
                  input(controller: addPostController.title, hintText: 'Title'),
                  const SizedBox(height: 10,),
                  input(controller: addPostController.body, hintText: 'Content', maxLines: 4),
                ],
              )
            ),
            const SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                if(isFormValid()) {
                  Post post = addPostController.getPost();
                  BlocProvider.of<AddPostBloc>(context).add(AddPostButtonPressed(post: post));
                }
              }, 
              style: Theme.of(context).textButtonTheme.style,
              child: const Text('Add',)
            )
          ],
        ),
      ),
    );
  }

  TextFormField input({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1
  }) => TextFormField(
    controller: controller,
    maxLines: maxLines,
    validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    decoration: InputDecoration(
      hintText: hintText
    ),
  );

  bool isFormValid() => addPostController.title.text.isNotEmpty && addPostController.body.text.isNotEmpty;

  Center messageText({
    required String message,
    required String type,
  }) => Center(
    child: Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: type == 'success' ? Colors.green.shade700 : Colors.red.shade700,
      ),
    ),
  );
}
