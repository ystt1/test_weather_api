import 'package:dartz/dartz.dart';
import 'package:demo_golden_owl/common/bloc/button/button_state.dart';
import 'package:demo_golden_owl/core/usecase.dart';
import 'package:demo_golden_owl/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> onGet({required UseCase useCase, dynamic params,dynamic type}) async {
    try {
      Either returnedData = await useCase.call(params: params);
      returnedData.fold(
        (error) => emit(ButtonFailureState(errorMsg: error)),
        (data) => emit(ButtonSuccessState(successMsg: data,type:type)),
      );
    } catch (e) {
      emit(ButtonFailureState(errorMsg: e.toString()));
    }
  }
}
