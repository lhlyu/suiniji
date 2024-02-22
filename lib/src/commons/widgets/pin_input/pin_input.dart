import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suiniji/src/commons/log/log.dart';

class PinInput extends StatefulWidget {
  final int numberOfFields;
  final double fieldWidth;
  final EdgeInsetsGeometry margin;
  final TextStyle? textStyle;
  final Function(String)? onSubmit;
  final bool autoFocus;
  final InputDecoration? decoration;

  const PinInput({
    super.key,
    this.numberOfFields = 4,
    this.fieldWidth = 40.0,
    this.margin = const EdgeInsets.only(right: 8.0),
    this.textStyle,
    this.onSubmit,
    this.autoFocus = false,
    this.decoration,
  });

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late List<String> _code;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.numberOfFields, (_) => TextEditingController());
    _focusNodes = List.generate(widget.numberOfFields, (_) => FocusNode());
    _code = List.filled(widget.numberOfFields, '');
    // 自动聚焦在第一个输入框
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    logger.d("$index, $value");
    setState(() {
      _code[index] = value;
    });
    if (value.length == 1 && index < widget.numberOfFields - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    if (_code.join().length == widget.numberOfFields) {
      // widget.onSubmit!(_code.join());
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> fields = List.generate(
      widget.numberOfFields,
      (index) => SizedBox(
        width: widget.fieldWidth,
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          showCursor: true,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          autofocus: widget.autoFocus,
          decoration: const InputDecoration(
            counterText: "",
          ),
          onChanged: (value) => _onChanged(value, index),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: fields,
    );
  }
}
