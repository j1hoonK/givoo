import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton(
      {super.key,
      required this.color,
      required this.image,
      required this.onPressed,
      required this.text});

  final Widget image;
  final Widget text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, //MaterialStateProperty.all(color(0xffececef))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          image,  //Image.asset('assets/images/glogo.png'),
          text,   //Text('Login with Goggle', style: TextStyle(color: Colors.black)),
          Opacity(
            // 투명도 조절하는 위젯_0: 투명
            opacity: 0,
            child: image  //Image.asset('assets/images/glogo.png'),
          ),
        ],
      ),
    );
  }
}
