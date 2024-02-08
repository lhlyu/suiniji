// Flutter imports:
import 'package:flutter/material.dart';

/// 加载页面
class AppStartupLoading extends StatelessWidget {
  const AppStartupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.asset(
              'logo.png',
              width: 80,
              height: 80,
            ),
          ),
        ),
      ),
    );
  }
}
