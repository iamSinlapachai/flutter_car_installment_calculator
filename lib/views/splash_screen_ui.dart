import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculator/views/input_screen_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    Future.delayed(
      //ระยะเวลา
      const Duration(seconds: 3),
      //ครบเวลาแล้วทำอะไรต่อ
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InputScreenUI(),
        ),
      ),
    );
    // Delay the navigation to the next screen after 3 seconds and then go to input screen
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/img01.png",
              width: 300,
            ),
            SizedBox(height: 50),
            Text(
              "Car Installment",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 193, 231, 148),
              ),
            ),
            Text(
              "Calculator",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 193, 231, 148),
              ),
            ),
            SizedBox(height: 50),
            CircularProgressIndicator(
              color: Colors.white70,
            ),
            SizedBox(height: 50),
            Text(
              "Created by Sinlapachai DTI-SAU",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: const Color.fromARGB(255, 193, 231, 148),
              ),
            ),
            Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: const Color.fromARGB(255, 193, 231, 148),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
