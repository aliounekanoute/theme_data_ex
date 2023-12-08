part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool appBrightness;
  const ThemeState({required this.appBrightness});

  @override
  List<Object> get props => [appBrightness];
}

