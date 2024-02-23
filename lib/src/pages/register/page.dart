// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "注册账号",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before_outlined),
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
