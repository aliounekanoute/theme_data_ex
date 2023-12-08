

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_data_ex/data/models/post_model.dart';
import 'package:theme_data_ex/features/add_post/screens/add_post_screen.dart';
import 'package:theme_data_ex/features/list_post/states/list_post_bloc/list_post_bloc.dart';
import 'package:theme_data_ex/features/list_post/states/theme_cubit/theme_cubit.dart';

class ListPostScreen extends StatefulWidget {
  const ListPostScreen({super.key});

  @override
  State<ListPostScreen> createState() => _ListPostScreenState();
}

class _ListPostScreenState extends State<ListPostScreen> {

  @override
  void initState() {
    BlocProvider.of<ListPostBloc>(context).add(FetchListPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Post Screen'),
      ),
      body: BlocBuilder<ListPostBloc, ListPostState>(
        builder: (context, state) {
          
          if(state is ListPostsSuccesState) {
            return body(posts: state.posts);  
          } else if (state is ListPostsErrorState) {
            return Center(
              child: Text(state.message, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPostScreen()));
        }
      ),
    );
  }


  SingleChildScrollView body({required List<Post> posts}) => SingleChildScrollView(
    padding: const EdgeInsets.only(top: 20),
    physics: const AlwaysScrollableScrollPhysics(),
    child: Column(
      children: posts.map((e) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          postWidget(post: e),
          const SizedBox(height: 12,),
          const Divider(
            color: Colors.grey,
          )
        ],
      )).toList(),
    ),

  );
  
  Widget postWidget({required Post post}) => Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10,),
        Text(
          post.body,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    ),
  );

  Widget brightnessWidgetSwitch() => BlocBuilder<ThemeCubit, ThemeState>(
    builder: (context, state) {
      return Switch(
        value: state.appBrightness, 
        onChanged: (bool newValue) {
          BlocProvider.of<ThemeCubit>(context).onBrightnessChange(appBrightness: newValue);
        }
      );
    },
  );
}
