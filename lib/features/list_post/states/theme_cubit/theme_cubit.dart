import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(appBrightness: true));

  void onBrightnessChange({required bool appBrightness}) => emit(ThemeState(appBrightness: appBrightness));
}
