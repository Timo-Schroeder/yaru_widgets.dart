import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

@immutable
class NavigationPageThemeData extends ThemeExtension<NavigationPageThemeData>
    with Diagnosticable {
  /// Creates a theme that can be used with [YaruNavigationPage].
  const NavigationPageThemeData({
    this.pageTransitions,
  });

  factory NavigationPageThemeData.fallback() {
    return const NavigationPageThemeData(
      pageTransitions: YaruPageTransitionsTheme.vertical,
    );
  }

  /// The page transitions to use.
  final PageTransitionsTheme? pageTransitions;

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  @override
  NavigationPageThemeData copyWith({
    PageTransitionsTheme? pageTransitions,
  }) {
    return NavigationPageThemeData(
      pageTransitions: pageTransitions ?? this.pageTransitions,
    );
  }

  @override
  ThemeExtension<NavigationPageThemeData> lerp(
    ThemeExtension<NavigationPageThemeData>? other,
    double t,
  ) {
    final o = other as NavigationPageThemeData?;
    return NavigationPageThemeData(
      pageTransitions: t < 0.5 ? pageTransitions : o?.pageTransitions,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('pageTransitions', pageTransitions));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NavigationPageThemeData &&
        other.pageTransitions == pageTransitions;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      pageTransitions,
    ]);
  }
}

class YaruNavigationPageTheme extends InheritedTheme {
  const YaruNavigationPageTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final NavigationPageThemeData data;

  static NavigationPageThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<YaruNavigationPageTheme>();
    return theme?.data ??
        Theme.of(context).extension<NavigationPageThemeData>() ??
        NavigationPageThemeData.fallback();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return YaruNavigationPageTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(YaruNavigationPageTheme oldWidget) {
    return data != oldWidget.data;
  }
}