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
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(message, style: Theme.of(context).textTheme.headlineSmall),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
