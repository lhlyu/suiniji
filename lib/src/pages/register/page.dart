// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:suiniji/src/commons/layouts/base_layout.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      title: "注册账号",
      child: Center(
        child: Text("注册"),
      ),
    );
  }
}
