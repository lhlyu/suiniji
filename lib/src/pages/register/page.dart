// Flutter imports:
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suiniji/src/commons/constants/strings.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(Strings.appName),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            /// 返回
            context.pop();
          },
        ),
      ),
      body: const Center(
        child: Text("注册"),
      ),
    );
  }
}
