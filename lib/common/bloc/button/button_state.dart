abstract class ButtonState{}

class ButtonInitialState extends ButtonState{}

class ButtonSuccessState extends ButtonState{
  final String successMsg;
  final String? type;
  ButtonSuccessState( {required this.successMsg,required this.type});
}

class ButtonFailureState extends ButtonState{
  final String errorMsg;

  ButtonFailureState({required this.errorMsg});
}