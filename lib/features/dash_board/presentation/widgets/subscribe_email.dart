import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/verify_payload.dart';
import 'package:demo_golden_owl/features/dash_board/domain/use_cases/sent_code_usecase.dart';
import 'package:demo_golden_owl/features/dash_board/domain/use_cases/subscribe_usecase.dart';
import 'package:flutter/material.dart';
import 'package:demo_golden_owl/responsive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/bloc/button/button_state.dart';
import '../../../../common/bloc/button/button_state_cubit.dart';

class SubscribeEmail extends StatefulWidget {
  final String location;

  const SubscribeEmail({super.key, required this.location});

  @override
  _SubscribeEmailState createState() => _SubscribeEmailState();
}

class _SubscribeEmailState extends State<SubscribeEmail> {
  final TextEditingController _emailController = TextEditingController();
  final _emailFormKey = GlobalKey<FormState>();
  bool _isCodeSent = false;
  List<TextEditingController> _codeControllers = List.generate(
    5,
    (index) => TextEditingController(),
  );
  int _countdown = 0;

  void _sendCode() {
    if (_emailFormKey.currentState!.validate()) {
      setState(() {
        _isCodeSent = true;
        _countdown = 60;
      });
      _startCountdown();
      context.read<ButtonStateCubit>().onGet(
        useCase: SentCodeUseCase(),
        params: _emailController.text,
      );
    }
  }

  void _startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
        _startCountdown();
      }
    });
  }

  void _subscribe(BuildContext context) {
    String code = _codeControllers.map((controller) => controller.text).join();
    VerifyPayload payload = VerifyPayload(
      email: _emailController.text,
      code: code,
      location: widget.location,
    );
    context.read<ButtonStateCubit>().onGet(
      useCase: SubscribeUseCase(),
      params: payload,
      type: 'subscribe',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonFailureState) {
          setState(() {
            _isCodeSent = false;
            _countdown = 0;
          });
        }
        if (state is ButtonSuccessState) {
          if (state.type == 'subscribe') {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Subscribe success")));
            setState(() {
              _codeControllers.map((e) => e.clear());
              _emailController.clear();
            });
          }
        }
      },
      child: Form(
        key: _emailFormKey,
        child: Column(
          children: [
            Responsive.isMobile(context)
                ? Column(
                  children: [
                    _emailField(),
                    SizedBox(height: 8),
                    _codeVerification(),
                  ],
                )
                : Row(
                  children: [
                    Expanded(child: _emailField()),
                    Expanded(child: _codeVerification()),
                  ],
                ),
            SizedBox(height: 16),

            context.watch<ButtonStateCubit>().state is ButtonFailureState
                ? Text(
                  (context.watch<ButtonStateCubit>().state
                          as ButtonFailureState)
                      .errorMsg,
                  style: TextStyle(color: Colors.red),
                )
                : SizedBox(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _codeControllers.every(
                          (controller) => controller.text.isNotEmpty,
                        ) &
                        _emailController.text.isNotEmpty
                    ? _subscribe(context)
                    : ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Center(child: Text('Enter all field'))),
                    );
              },
              child: Text('Subscribe', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _codeVerification() {
    return Row(
      mainAxisAlignment:
          Responsive.isMobile(context)
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Container(
          width: 40,
          margin: EdgeInsets.symmetric(horizontal: 4),
          child: TextField(
            style: TextStyle(color: AppColors.primaryColor),
            controller: _codeControllers[index],
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(counterText: ''),
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: _emailController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Enter your email',
        suffixIcon: TextButton(
          onPressed: _countdown == 0 ? _sendCode : null,
          child: Text(_countdown > 0 ? '$_countdown s' : 'Send Code'),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email cannot be empty';
        }
        if (!RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        ).hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}
