// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/widgets/input/input.dart';
import 'package:suiniji/src/controllers/index.dart';

class PhoneInput extends ConsumerStatefulWidget {
  const PhoneInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhoneInputState();
}

class _PhoneInputState extends ConsumerState<PhoneInput> {
  final controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 100), () {
    //   focusNode.requestFocus();
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  /// 获取清除按钮
  Widget getClearIcon({bool suffix = true}) {
    final enable = ref.watch(loginControllerProvider).mobile.isNotEmpty && suffix;
    final opacity = enable ? 1.0 : 0.0;

    return Opacity(
      opacity: opacity,
      child: IconButton(
        icon: const Icon(
          Icons.clear_outlined,
          size: 16,
        ),
        onPressed: enable
            ? () {
                controller.clear();
                ref.read(loginControllerProvider.notifier).update(mobile: "");
                HapticFeedback.vibrate();
              }
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 48,
      child: CommonInput(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.phone,
        maxLength: 13,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')),
          CustomTextInputFormatter(),
        ],
        onChanged: (value) {
          ref.read(loginControllerProvider.notifier).update(mobile: controller.text);
        },
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        maxLengthEnforcement: MaxLengthEnforcement.none,
        suffixIcon: getClearIcon(),
        // 当存在清除按钮时，使用透明Icon作为前缀以保持文本居中
        prefixIcon: getClearIcon(suffix: false),
        hintText: "请输入手机号",
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

    int cursorPosition = newValue.selection.baseOffset;

    if (cursorPosition > 3) {
      cursorPosition += 1;
    }

    if (cursorPosition > 7) {
      cursorPosition += 1;
    }

    if (cursorPosition >= buffer.toString().length) {
      cursorPosition = buffer.toString().length;
    }

    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
