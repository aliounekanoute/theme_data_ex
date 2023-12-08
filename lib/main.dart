import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_data_ex/features/add_post/states/add_post_bloc/add_post_bloc.dart';
import 'package:theme_data_ex/features/list_post/screens/lis_post_screen.dart';
import 'package:theme_data_ex/features/list_post/states/list_post_bloc/list_post_bloc.dart';
import 'package:theme_data_ex/features/list_post/states/theme_cubit/theme_cubit.dart';
import 'package:theme_data_ex/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AddPostBloc addPostBloc = AddPostBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddPostBloc>(
          create: (context) => addPostBloc,
        ),
        BlocProvider<ListPostBloc>(
          create: (context) => ListPostBloc(addPostBloc: addPostBloc),
        ),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit())
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state.appBrightness ? appTheme : darkTheme,
            home: const ListPostScreen(),
          );
        },
      ),
    );
  }
}
