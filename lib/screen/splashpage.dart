import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  moveForward() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed("/");
  }

  @override
  void initState() {
    moveForward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffC5E4B5),
      body: Center(
        child: ClipRRect(
          child: Image(
            image: AssetImage("assets/images/Logo.gif"),
            fit: BoxFit.cover,
            height: 280,
          ),
        ),
      ),
    );
  }
}