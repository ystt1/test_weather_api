import 'package:demo_golden_owl/responsive.dart';
import 'package:flutter/material.dart';

class SubscribeEmail extends StatelessWidget {
  const SubscribeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Responsive.isMobile(context)? Column(
          children: [
            _emailField(),
            SizedBox(height: 8,),
            _subscribeButton()
          ],
        ):Row(
          children: [
            Expanded(
                flex: 1,
                child: _emailField()
            ),
            SizedBox(width: 16,),
            Expanded(flex: 1,
                child: _subscribeButton())
          ],


    );
  }

  Widget _emailField() {
    return TextField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Enter your email',
      ),
    );
  }

  Widget _subscribeButton() {
    return ElevatedButton(onPressed: () {}, child: Text('Subscribe',style: TextStyle(color: Colors.white)));
  }
}
