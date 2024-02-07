// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 电话输入框
class PhoneInput extends StatefulWidget {
  final double width;
  final double height;
  final double radius;
  final void Function(String)? onChanged;

  const PhoneInput({
    super.key,
    this.width = 280,
    this.height = 48,
    this.radius = 8,
    this.onChanged,
  });

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.07),
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: TextField(
        controller: _controller,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
        keyboardType: TextInputType.phone,
        maxLength: 13,
        textAlign: TextAlign.center,
        cursorColor: Theme.of(context).textTheme.bodyLarge?.color,
        decoration: InputDecoration(
          hintText: '请输入手机号',
          counterText: "",
          border: InputBorder.none,
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                    size: 16,
                  ),
                  onPressed: () {
                    _controller.clear();
                    widget.onChanged!("");
                    HapticFeedback.vibrate();
                  },
                )
              : null,
          // 当存在清除按钮时，使用透明Icon作为前缀以保持文本居中
          prefixIcon: _controller.text.isNotEmpty
              ? const Opacity(
                  opacity: 0,
                  child: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: null,
                  ),
                )
              : null,
        ),
        scrollPadding: EdgeInsets.zero,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')),
          CustomTextInputFormatter(),
        ],
        maxLengthEnforcement: MaxLengthEnforcement.none,
        onChanged: widget.onChanged,
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
    if (newText.length > _phoneLength) {
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
