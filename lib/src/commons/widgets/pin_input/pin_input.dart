// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';
import 'package:suiniji/src/commons/widgets/blinking_cursor/blinking_cursor.dart';

class PinInput extends StatefulWidget {
  final int count;
  final bool disabled;
  final ValueChanged<String>? onComplete;

  const PinInput({
    super.key,
    this.count = 6,
    this.disabled = false,
    this.onComplete,
  });

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  final TextEditingController controller = TextEditingController();
  final FocusNode pinInputFocusNode = FocusNode();
  late List<String> codes;
  int current = 0;

  @override
  void initState() {
    super.initState();
    codes = List.generate(widget.count, (index) => "");
  }

  Widget _buildInputWidget(int p, Color textColor) {
    final isCurrent = p == current;

    return Container(
      height: 32,
      width: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCurrent ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background,
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadiusSizes.sm,
      ),
      child: isCurrent
          ? const BlinkingCursor()
          : Text(
              codes[p],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = Theme.of(context).primaryColor;

    return Stack(
      children: [
        TextField(
          controller: controller,
          focusNode: pinInputFocusNode,
          autofocus: true,
          enabled: true,
          keyboardType: TextInputType.number,
          readOnly: widget.disabled,

          /// 只能为数字
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(widget.count),
          ],
          // 隐藏光标与字体颜色，达到隐藏输入框的目的
          cursorColor: Colors.transparent,
          cursorWidth: 0,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "",
          ),

          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.transparent),
          onChanged: (v) {
            for (var i = 0; i < widget.count; i++) {
              if (i < v.length) {
                codes[i] = v.substring(i, i + 1);
              } else {
                codes[i] = '';
              }
            }
            if (v.isEmpty) {
              current = 0;
            } else {
              current = v.length;
            }
            if (v.length == widget.count) {
              HapticFeedback.lightImpact();
              widget.onComplete!(codes.join(''));
              current = 0;
              controller.text = '';
              for (var i = 0; i < widget.count; i++) {
                codes[i] = '';
              }
            }
            setState(() {});
          },
        ),
        Semantics(
          label: '点击输入',
          child: GestureDetector(
            onTap: () {
              /// 一直怼，会有概率造成键盘抖动，加一个键盘时候弹出判断
              if (MediaQuery.of(context).viewInsets.bottom < 10) {
                final focusScope = FocusScope.of(context);
                focusScope.unfocus();
                Future.delayed(
                  Duration.zero,
                  () => focusScope.requestFocus(pinInputFocusNode),
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                widget.count,
                (i) => _buildInputWidget(
                  i,
                  textColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
