// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

class VPasswordPage extends StatelessWidget {
  const VPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "密码登录",
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
        child: Text("密码校验"),
      ),
    );
  }
}
