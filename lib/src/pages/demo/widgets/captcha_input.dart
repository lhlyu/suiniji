// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 验证码输入
class CaptchaInput extends StatefulWidget {
  final double width;
  final double height;
  final double radius;
  final bool canSendCaptcha;
  final void Function(String)? onChanged;
  final Future<bool> Function()? onSendCaptcha;

  const CaptchaInput({
    super.key,
    this.width = 280,
    this.height = 48,
    this.radius = 8,
    this.canSendCaptcha = false,
    this.onChanged,
    this.onSendCaptcha,
  });

  @override
  State<CaptchaInput> createState() => _CaptchaInputState();
}

class _CaptchaInputState extends State<CaptchaInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isSendCaptcha = false;
  Timer? _timer;
  int _start = 0;

  @override
  void didUpdateWidget(covariant CaptchaInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.canSendCaptcha != oldWidget.canSendCaptcha && oldWidget.canSendCaptcha == true) {
      setState(() {
        _isSendCaptcha = false;
        _controller.clear();
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer?.cancel();

    setState(() {
      _start = 10;
    });
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget _buildCaptchaInput(BuildContext context) {
    return TextField(
      controller: _controller,
      enabled: _isSendCaptcha,
      keyboardType: TextInputType.phone,
      maxLength: 6,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: '验证码',
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
      ],
      onChanged: widget.onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.03),
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildCaptchaInput(context),
          ),
          SizedBox(
            width: 100,
            child: Focus(
              focusNode: _focusNode,
              child: TextButton(
                style: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                onPressed: (_start == 0 && widget.canSendCaptcha)
                    ? () async {
                        HapticFeedback.lightImpact();
                        _focusNode.requestFocus();
                        if (await widget.onSendCaptcha!()) {
                          setState(() {
                            startTimer();
                            _controller.clear();
                            _isSendCaptcha = true;
                          });
                        }
                      }
                    : null,
                child: Text(
                  _start > 0 ? '$_start秒后重发' : '发送验证码',
                  style: (_start == 0 && widget.canSendCaptcha)
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
