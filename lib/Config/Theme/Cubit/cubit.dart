import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/Config/Theme/Cubit/states.dart';
import 'package:weather_application/Core/Network/cacheHelper.dart';

class ThemeAppCubit extends Cubit<ThemeAppStates> {
  ThemeAppCubit()
      : super(
          InitialThemeAppState(),
        );
  static ThemeAppCubit get(
    context,
  ) =>
      BlocProvider.of(
        context,
      );

  bool IsDark = false;
  void ChangeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      IsDark = fromShared;
      emit(
        AppChangeModeState(),
      );
    } else {
      IsDark = !IsDark;
      CacheHelper.putDate(
        key: 'IsDark',
        value: IsDark,
      ).then(
        (
          value,
        ) {
          emit(AppChangeModeState());
        },
      );
    }
  }
}
