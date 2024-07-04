// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/gen/assets.gen.dart';
import 'package:suiniji/src/commons/extension/theme.dart';

Future<bool?> commonPictureClickCaptcha(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        child: const _PictureClickCaptcha(
          4,
          [Offset(50, 100), Offset(150, 200), Offset(250, 300), Offset(350, 400)],
          20,
        ),
      );
    },
  );
}

// 图片点击验证码
class _PictureClickCaptcha extends StatefulWidget {
  final int maxMarks; // 最大标记数
  final List<Offset> targetPoints; // 目标坐标点
  final double tolerance; // 容忍误差范围

  const _PictureClickCaptcha(this.maxMarks, this.targetPoints, this.tolerance);

  @override
  _PictureClickCaptchaState createState() => _PictureClickCaptchaState();
}

class _PictureClickCaptchaState extends State<_PictureClickCaptcha> {
  // 用户标记的坐标点
  final List<Offset> _markedPoints = [];

  @override
  Widget build(BuildContext context) {
    // 确保刷新按钮在右上角
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            // 图片展示和点击标记逻辑
            GestureDetector(
                onTapUp: _handleTap,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Assets.test.image(
                    fit: BoxFit.cover,
                  ),
                )),
            // 在图片上标记点击的位置
            ..._markedPoints.map((point) => Positioned(
                  left: point.dx - 10,
                  top: point.dy - 10,
                  child: _buildMarkWidget(context, _markedPoints.indexOf(point) + 1),
                )),
            // 刷新按钮
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                mini: true, // 使用小图标
                onPressed: _resetMarks,
                child: const Icon(Icons.refresh),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Text(
            "随便点击图片四次",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  // 构建标记显示的Widget
  Widget _buildMarkWidget(BuildContext context, int number) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$number',
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  // 处理图片点击事件
  void _handleTap(TapUpDetails details) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset localPosition = renderBox.globalToLocal(details.globalPosition);
    if (_markedPoints.length < widget.maxMarks) {
      setState(() {
        _markedPoints.add(localPosition);
      });
    }

    // 当达到最大标记次数时打印日志
    if (_markedPoints.length == widget.maxMarks) {
      Navigator.of(context).pop(true);
    }
  }

  // 重置标记点
  void _resetMarks() {
    setState(() {
      _markedPoints.clear();
    });
  }
}
