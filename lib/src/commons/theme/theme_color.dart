// Flutter imports:
import 'package:flutter/material.dart';

class ThemeColor {
  final Brightness brightness;
  final Color baseColor;
  final Color invertBaseColor;
  final Color primaryColor;
  final Color primaryColorHover;
  final Color primaryColorPressed;
  final Color primaryColorSuppl;
  final Color infoColor;
  final Color infoColorHover;
  final Color infoColorPressed;
  final Color infoColorSuppl;
  final Color successColor;
  final Color successColorHover;
  final Color successColorPressed;
  final Color successColorSuppl;
  final Color warningColor;
  final Color warningColorHover;
  final Color warningColorPressed;
  final Color warningColorSuppl;
  final Color errorColor;
  final Color errorColorHover;
  final Color errorColorPressed;
  final Color errorColorSuppl;
  final Color textColorBase;
  final Color textColor1;
  final Color textColor2;
  final Color textColor3;
  final Color textColorDisabled;
  final Color placeholderColor;
  final Color placeholderColorDisabled;
  final Color iconColor;
  final Color iconColorHover;
  final Color iconColorPressed;
  final Color iconColorDisabled;
  final double opacity1;
  final double opacity2;
  final double opacity3;
  final double opacity4;
  final double opacity5;
  final Color dividerColor;
  final Color borderColor;
  final Color closeIconColor;
  final Color closeIconColorHover;
  final Color closeIconColorPressed;
  final Color closeColorHover;
  final Color closeColorPressed;
  final Color clearColor;
  final Color clearColorHover;
  final Color clearColorPressed;
  final Color progressRailColor;
  final Color railColor;
  final Color popoverColor;
  final Color tableColor;
  final Color cardColor;
  final Color modalColor;
  final Color bodyColor;
  final Color tagColor;
  final Color avatarColor;
  final Color invertedColor;
  final Color inputColor;
  final Color codeColor;
  final Color tabColor;
  final Color actionColor;
  final Color tableHeaderColor;
  final Color hoverColor;
  final Color tableColorHover;
  final Color tableColorStriped;
  final Color pressedColor;
  final double opacityDisabled;
  final Color inputColorDisabled;
  final Color buttonColor2;
  final Color buttonColor2Hover;
  final Color buttonColor2Pressed;

  const ThemeColor({
    required this.brightness,
    required this.baseColor,
    required this.invertBaseColor,
    required this.primaryColor,
    required this.primaryColorHover,
    required this.primaryColorPressed,
    required this.primaryColorSuppl,
    required this.infoColor,
    required this.infoColorHover,
    required this.infoColorPressed,
    required this.infoColorSuppl,
    required this.successColor,
    required this.successColorHover,
    required this.successColorPressed,
    required this.successColorSuppl,
    required this.warningColor,
    required this.warningColorHover,
    required this.warningColorPressed,
    required this.warningColorSuppl,
    required this.errorColor,
    required this.errorColorHover,
    required this.errorColorPressed,
    required this.errorColorSuppl,
    required this.textColorBase,
    required this.textColor1,
    required this.textColor2,
    required this.textColor3,
    required this.textColorDisabled,
    required this.placeholderColor,
    required this.placeholderColorDisabled,
    required this.iconColor,
    required this.iconColorHover,
    required this.iconColorPressed,
    required this.iconColorDisabled,
    required this.opacity1,
    required this.opacity2,
    required this.opacity3,
    required this.opacity4,
    required this.opacity5,
    required this.dividerColor,
    required this.borderColor,
    required this.closeIconColor,
    required this.closeIconColorHover,
    required this.closeIconColorPressed,
    required this.closeColorHover,
    required this.closeColorPressed,
    required this.clearColor,
    required this.clearColorHover,
    required this.clearColorPressed,
    required this.progressRailColor,
    required this.railColor,
    required this.popoverColor,
    required this.tableColor,
    required this.cardColor,
    required this.modalColor,
    required this.bodyColor,
    required this.tagColor,
    required this.avatarColor,
    required this.invertedColor,
    required this.inputColor,
    required this.codeColor,
    required this.tabColor,
    required this.actionColor,
    required this.tableHeaderColor,
    required this.hoverColor,
    required this.tableColorHover,
    required this.tableColorStriped,
    required this.pressedColor,
    required this.opacityDisabled,
    required this.inputColorDisabled,
    required this.buttonColor2,
    required this.buttonColor2Hover,
    required this.buttonColor2Pressed,
  });

  ThemeData get theme {
    return ThemeData(
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        background: baseColor,
        onBackground: textColorBase,
        primary: primaryColor,
        onPrimary: baseColor,
        secondary: buttonColor2,
        onSecondary: primaryColor,
        error: errorColor,
        onError: baseColor,
        surface: baseColor,
        onSurface: invertBaseColor,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: modalColor,
        elevation: 0,
        surfaceTintColor: textColorBase,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      cardColor: cardColor,
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return primaryColorHover;
            }
            if (states.contains(MaterialState.focused)) {
              return primaryColorPressed;
            }
            if (states.contains(MaterialState.pressed)) {
              return primaryColorPressed;
            }
            if (states.contains(MaterialState.disabled)) {
              return primaryColor.withOpacity(0.65);
            }
            // 默认状态下的背景色
            return primaryColor;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return brightness == Brightness.dark ? textColorDisabled : baseColor.withOpacity(0.8);
            }
            return baseColor;
          }),
          elevation: const MaterialStatePropertyAll(0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return textColorDisabled;
            }
            return textColorBase;
          }),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: dividerColor,
        space: 1,
        thickness: 1,
      ),
    );
  }
}
