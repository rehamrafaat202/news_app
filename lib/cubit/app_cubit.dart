import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/local/shared_preference.dart';

class AppCubit extends Cubit<ParentState> {
  AppCubit() : super(NewsInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeMode({bool? fromCashed}) {
    if (fromCashed != null) {
      isDark = fromCashed;
      emit(GetChangeModeState());
    } else {
      isDark = !isDark;
      CrashHelper.putBooleanData(key: "isDark", value: isDark)
          .then((value) => emit(GetChangeModeState()));
    }
  }
}
