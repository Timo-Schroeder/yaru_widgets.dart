import 'package:flutter/material.dart';

import 'yaru_switch.dart';
import 'yaru_toggle_button.dart';
import 'yaru_toggle_button_theme.dart';

/// A desktop style switch button with an interactive label.
class YaruSwitchButton extends StatelessWidget {
  /// Creates a new switch button.
  const YaruSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.contentPadding,
    this.autofocus = false,
    this.focusNode,
    this.mouseCursor,
  });

  /// See [Switch.value]
  final bool value;

  /// See [Switch.onChanged]
  final ValueChanged<bool>? onChanged;

  /// See [YaruToggleButton.title]
  final Widget title;

  /// See [YaruToggleButton.subtitle]
  final Widget? subtitle;

  /// See [YaruToggleButton.contentPadding]
  final EdgeInsetsGeometry? contentPadding;

  /// See [Switch.focusNode].
  final FocusNode? focusNode;

  /// See [Switch.autofocus].
  final bool autofocus;

  /// See [Switch.mouseCursor].
  final MouseCursor? mouseCursor;

  @override
  Widget build(BuildContext context) {
    final mouseCursor = this.mouseCursor ??
        YaruToggleButtonTheme.of(context)
            ?.mouseCursor
            ?.resolve({if (onChanged == null) MaterialState.disabled});

    return YaruToggleButton(
      title: title,
      subtitle: subtitle,
      contentPadding: contentPadding,
      leading: YaruSwitch(
        value: value,
        onChanged: onChanged,
        focusNode: focusNode,
        autofocus: autofocus,
        mouseCursor: mouseCursor,
      ),
      mouseCursor: mouseCursor ??
          (onChanged != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic),
      onToggled: onChanged != null ? () => onChanged!(!value) : null,
    );
  }
}