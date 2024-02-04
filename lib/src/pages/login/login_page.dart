// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/pages/login/widgets/agreement_checkbox.dart';
import 'package:suiniji/src/pages/login/widgets/captcha_button.dart';
import 'package:suiniji/src/pages/login/widgets/footer.dart';
import 'package:suiniji/src/pages/login/widgets/password_button.dart';
import 'package:suiniji/src/pages/login/widgets/phone_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const double _w = 280;
  static const double _h = 48;
  static const double _r = 8;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhoneInput(_w, _h, _r),
            SizedBox(height: 16),
            CaptchaButton(_w, _h, _r),
            PasswordButton(),
            AgreementCheckbox(_w),
            SizedBox(height: 36),
          ],
        ),
      ),
      bottomSheet: Footer(),
    );
  }
}
