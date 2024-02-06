// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 电话输入框
class PhoneInput extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final void Function(String)? onChange;

  const PhoneInput({
    super.key,
    this.width = 280,
    this.height = 48,
    this.radius = 8,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        // color: Theme.of(context).brightness == Brightness.dark ? const Color(0xff44475a) : Colors.grey[200],
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextField(
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
        onChanged: onChange,
      ),
    );
  }
}

/// 自定义输入
class CustomTextInputFormatter extends TextInputFormatter {
  static const _phoneLength = 11;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(' ', '');
    if (newText.length >= _phoneLength) {
      newText = newText.substring(0, _phoneLength);
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
