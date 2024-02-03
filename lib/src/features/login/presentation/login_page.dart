// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/constants.dart';
import 'package:suiniji/src/commons/widgets/link_text/link_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const double _containerWidth = 280;
  static const double _containerHeight = 48;
  static final BorderRadius _radius = BorderRadius.circular(8);

  /// 电话输入框
  Widget _buildPhoneInput(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      height: _containerHeight,
      width: _containerWidth,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark ? const Color(0xff44475a) : Colors.grey[200],
        borderRadius: _radius,
      ),
      child: TextField(
        controller: controller,
        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: TextInputType.phone,
        maxLength: 13,
        textAlign: TextAlign.center,
        cursorColor: Theme.of(context).textTheme.bodyLarge?.color,
        decoration: const InputDecoration(
          hintText: '手机号码',
          contentPadding: EdgeInsets.zero,
          counterText: "",
          border: InputBorder.none,
        ),
        scrollPadding: EdgeInsets.zero,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')),
          CustomTextInputFormatter(),
        ],
        maxLengthEnforcement: MaxLengthEnforcement.none,
      ),
    );
  }

  /// 验证码登录
  Widget _buildCaptchaButton(BuildContext context) {
    return FilledButton(
      onPressed: () {
        HapticFeedback.lightImpact();
      },
      style: TextButton.styleFrom(
        elevation: 0,
        fixedSize: const Size(_containerWidth, _containerHeight),
        shape: RoundedRectangleBorder(
          borderRadius: _radius,
        ),
        enableFeedback: true,
      ),
      child: Text(
        "验证码登录",
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
          color: Colors.white,
        ),
      ),
    );
  }

  /// 账号密码登录
  Widget _buildPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        HapticFeedback.lightImpact();
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size.fromHeight(20),
        ),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        "账号密码登录",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  /// 协议同意
  Widget _buildAgreement(BuildContext context) {
    return SizedBox(
      width: _containerWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: CommonLinkText(
              text: Constants.agreement,
              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 1.7,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          )
        ],
      ),
    );
  }

  /// 底部
  Widget _buildFooter(BuildContext context) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () {
            /// 跳转到rift
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              Constants.appName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPhoneInput(context),
            const SizedBox(height: 16),
            _buildCaptchaButton(context),
            _buildPasswordButton(context),
            _buildAgreement(context),
            const SizedBox(height: 36),
          ],
        ),
      ),
      bottomSheet: _buildFooter(context),
    );
  }
}

/// 自定义输入
class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(' ', '');
    if (newText.length >= 11) {
      newText = newText.substring(0, 11);
      HapticFeedback.vibrate();
    }
    if (oldValue.text.length <= 1 && newText.isEmpty) {
      HapticFeedback.vibrate();
    }
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i == 3 || i == 7) {
        buffer.write(' ');
      }
      buffer.write(newText[i]);
    }

    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
  }
}
