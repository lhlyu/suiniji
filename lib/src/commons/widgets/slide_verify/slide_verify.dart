// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 自定义滑动确认组件
class CommonSlideVerify extends StatefulWidget {
  final double height;
  final double width;
  final double radius;

  /// 确认回调 (轨迹，持续时间, 机器人的可能性)
  final void Function(List<Offset> points, int duration, int bot)? onConfirmation;

  const CommonSlideVerify({
    super.key,
    this.height = 48.0,
    this.width = 280.0,
    this.radius = 8.0,
    this.onConfirmation,
  }) : assert(height >= 25 && width >= 250);

  @override
  _CommonSlideVerifyState createState() => _CommonSlideVerifyState();
}

class _CommonSlideVerifyState extends State<CommonSlideVerify> {
  // 用于存储滑动轨迹的点
  List<Offset> points = [];

  // 存储滑动开始时间
  DateTime? startTime;
  // 存储滑动结束时间
  DateTime? endTime;

  /// 当前滑块的位置
  double _position = 0.0;

  /// 滑块是否处在最右侧
  bool _end = false;

  @override
  Widget build(BuildContext context) {
    /// GestureDetector: 用于检测和响应用户的触摸操作，如轻触、长按、滑动等
    return GestureDetector(
      onPanStart: (details) {
        if (_end) {
          return;
        }
        // 清除之前的点并记录滑动开始时间
        points.clear();
        startTime = DateTime.now();
        setState(() {
          points.add(details.localPosition);
        });
      },
      onPanUpdate: (details) {
        if (_end) {
          return;
        }
        setState(() {
          _position = details.localPosition.dx - (widget.height / 2);
          _position = _position.clamp(0.0, widget.width - widget.height);
          points.add(details.localPosition);
        });
      },
      onPanEnd: (details) {
        if (_end) {
          return;
        }
        endTime = DateTime.now();
        // 计算滑动持续时间
        final duration = endTime!.difference(startTime!).inMilliseconds;

        if (_position >= widget.width - widget.height) {
          setState(() {
            _end = true;
          });
          HapticFeedback.vibrate();

          int bot = 0;

          if (duration < 100) {
            bot += 1;
          }
          if (points.length < 4) {
            bot += 1;
          }

          if (points.isNotEmpty) {
            double y = points.first.dy;

            bool isBot = true;
            for (var element in points) {
              if (element.dy != y) {
                isBot = false;
                break;
              }
            }
            if (isBot) {
              bot += 1;
            }
          }

          widget.onConfirmation?.call(points, duration, bot);
        }
        if (!_end) {
          setState(() {
            _position = 0.0;
            HapticFeedback.lightImpact();
          });
        }
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark ? const Color(0xff44475a) : Colors.grey[200],
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              _end ? "验证成功" : "滑动到最右侧",
              style: TextStyle(
                color: Theme.of(context).hintColor,
              ),
            ),
            Positioned(
              left: _position,
              child: Container(
                height: widget.height - 10,
                width: widget.height - 10,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(widget.radius),
                ),
                child: Center(
                  child: _end
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
