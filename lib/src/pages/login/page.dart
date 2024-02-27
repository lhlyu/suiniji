// Flutter imports:
import 'package:flutter/material.dart';
import 'package:suiniji/src/commons/layouts/base_layout.dart';

// Project imports:
import 'package:suiniji/src/pages/login/widgets/agreement_checkbox.dart';
import 'package:suiniji/src/pages/login/widgets/captcha_button.dart';
import 'package:suiniji/src/pages/login/widgets/password_button.dart';
import 'package:suiniji/src/pages/login/widgets/phone_input.dart';

/// 登录页面
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      hasFooter: true,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PhoneInput(),
              SizedBox(height: 16),
              CaptchaButton(),
              SizedBox(height: 12),
              PasswordButton(),
              SizedBox(height: 8),
              AgreementCheckbox(),
            ],
          ),
        ),
      ),
    );
  }
}
