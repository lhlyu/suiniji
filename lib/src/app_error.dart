// Flutter imports:
import 'package:flutter/material.dart';

class AppStartupError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const AppStartupError({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text('发生了一些异常'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 14,
            ),
            child: Text(message),
          ),
        ),
      ),
    );
  }
}
