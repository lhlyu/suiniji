// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/commons/widgets/app_footer/app_footer.dart';
import 'package:suiniji/src/commons/widgets/pin_input/pin_input.dart';

class VCaptchaPage extends StatelessWidget {
  const VCaptchaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) return Colors.transparent;
          if (states.contains(MaterialState.pressed)) return Colors.transparent;
          return null;
        },
      ),
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      textStyle: MaterialStateProperty.all<TextStyle>(
        Theme.of(context).textTheme.bodySmall!,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "短信验证码登录",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48,
          horizontal: 48,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "输入短信验证码",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                "短信验证码至 11293432434",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 48),
              const SizedBox(
                width: 220,
                child: PinInput(),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    style: buttonStyle,
                    child: const Text("39秒后重新发送"),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                    },
                    style: buttonStyle,
                    child: const Text(
                      "没收到验证码？",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const AppFooter(),
    );
  }
}
