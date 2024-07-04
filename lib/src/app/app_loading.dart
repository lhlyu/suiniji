// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/gen/assets.gen.dart';

/// 加载页面
class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Assets.logo.image(
              width: 80,
              height: 80,
            ),
          ),
        ),
      ),
    );
  }
}
