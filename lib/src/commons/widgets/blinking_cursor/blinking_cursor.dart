// Flutter imports:
import 'package:flutter/material.dart';

/// 闪烁的光标
class BlinkingCursor extends StatefulWidget {
  /// 高度
  final double height;

  /// 宽度
  final double width;

  /// 颜色
  final Color color;

  const BlinkingCursor({
    super.key,
    this.height = 16,
    this.width = 2,
    this.color = Colors.white,
  });

  @override
  State<BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<BlinkingCursor> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        height: widget.height,
        width: widget.width,
        color: widget.color,
      ),
    );
  }
}
