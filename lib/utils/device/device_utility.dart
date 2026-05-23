import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtils {
  DeviceUtils._();

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomSafeAreaHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getKeyboardHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static bool isKeyboardVisible(BuildContext context) {
    return getKeyboardHeight(context) > 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLandscapeOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static bool get isWeb {
    return kIsWeb;
  }

  static bool get isAndroid {
    return !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
  }

  static bool get isIOS {
    return !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
  }

  static bool get isMacOS {
    return !kIsWeb && defaultTargetPlatform == TargetPlatform.macOS;
  }

  static bool get isWindows {
    return !kIsWeb && defaultTargetPlatform == TargetPlatform.windows;
  }

  static bool get isLinux {
    return !kIsWeb && defaultTargetPlatform == TargetPlatform.linux;
  }

  static String get platformName {
    if (isWeb) return 'web';
    if (isAndroid) return 'android';
    if (isIOS) return 'ios';
    if (isMacOS) return 'macos';
    if (isWindows) return 'windows';
    if (isLinux) return 'linux';

    return 'unknown';
  }

  static Future<void> setPreferredOrientations(
    List<DeviceOrientation> orientations,
  ) {
    return SystemChrome.setPreferredOrientations(orientations);
  }

  static void setStatusBarColor(
    Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color
      ),
    );
  }

  static void setNavigationBarColor(
    Color color, {
    Brightness iconBrightness = Brightness.light,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: color,
        systemNavigationBarIconBrightness: iconBrightness,
      ),
    );
  }

  static Future<void> enableFullScreen() {
    return SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  static Future<void> disableFullScreen() {
    return SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  static Future<void> vibrate() {
    return HapticFeedback.lightImpact();
  }
}
