import 'package:flutter_bloc/flutter_bloc.dart';

class SeeMoreCubit extends Cubit<int> {
  SeeMoreCubit() : super(4);

  onExpand() {
    if (state != 12) {
      int flag = state + 4;

      emit(flag);
    }
  }

  onCollapse() {
    if (state > 4) {
      int flag = state - 4;
      emit(flag);
    }
  }
}
