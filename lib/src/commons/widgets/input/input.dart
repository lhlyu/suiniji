// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';

class CommonInput extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final TapRegionCallback? onTapOutside;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;

  const CommonInput({
    super.key,
    this.controller,
    this.focusNode,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onTapOutside,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.maxLength,
    this.maxLengthEnforcement,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: true,
      enableSuggestions: false,
      autocorrect: false,
      maxLength: maxLength,
      textAlign: TextAlign.center,
      scrollPadding: EdgeInsets.zero,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onTapOutside: onTapOutside,
      style: context.textTheme.bodyMedium?.bold(),
      maxLengthEnforcement: maxLengthEnforcement,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadiusSizes.defaultSize,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadiusSizes.defaultSize,
        ),
        contentPadding: const EdgeInsets.all(12),
        counterText: "",
        border: InputBorder.none,
        hoverColor: Colors.transparent,
        fillColor: context.isDarkMode ? Colors.black26 : Colors.grey.shade200,
        hintText: hintText,
      ),
    );
  }
}
