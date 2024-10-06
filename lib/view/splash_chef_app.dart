import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_cook/view/login_page.dart';

class SplashChefApp extends StatefulWidget {
  const SplashChefApp({super.key});

  @override
  State<SplashChefApp> createState() => _SplashChefAppState();
}

class _SplashChefAppState extends State<SplashChefApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
     const Duration(seconds: 8),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()),),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFA9A0C),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/image 47.png'))),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Chef App',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Lato',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
