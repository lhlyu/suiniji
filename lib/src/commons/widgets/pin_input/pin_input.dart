// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';
import 'package:suiniji/src/commons/widgets/blinking_cursor/blinking_cursor.dart';

class PinInput extends StatefulWidget {
  final int count;

  const PinInput({
    super.key,
    this.count = 4,
  });

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
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
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCurrent ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background,
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadiusSizes.defaultSize,
      ),
      child: isCurrent
          ? const BlinkingCursor()
          : Text(
              codes[p],
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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
          focusNode: focusNode,
          autofocus: true,
          keyboardType: TextInputType.number,

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
            // if (v.length == _codeList.length) {
            //   for (var i = 0; i < _codeList.length; i++) {
            //     _codeList[i] = '';
            //   }
            // }
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
                  () => focusScope.requestFocus(focusNode),
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
