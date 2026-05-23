import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class AppHelpers {
  AppHelpers._();

  static const double _thailandTaxRate = 0.07;
  static const double _defaultThailandShippingCost = 50;
  static const double _defaultUnitedStatesShippingCost = 5.99;
  static const double _defaultThailandFreeShippingThreshold = 1000;
  static const double _defaultUnitedStatesFreeShippingThreshold = 50;

  static void showSnackBar(
    BuildContext context,
    String message, {
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          duration: duration,
        ),
      );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      backgroundColor: Colors.green,
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
  }

  static Future<T?> showAlert<T>(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = 'OK',
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }

  static Future<T?> navigateToScreen<T>(
    BuildContext context,
    Widget screen,
  ) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute<T>(
        builder: (_) => screen,
      ),
    );
  }

  static Future<T?> replaceScreen<T, TO>(
    BuildContext context,
    Widget screen, {
    TO? result,
  }) {
    return Navigator.of(context).pushReplacement<T, TO>(
      MaterialPageRoute<T>(
        builder: (_) => screen,
      ),
      result: result,
    );
  }

  static void pop<T>(BuildContext context, [T? result]) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop<T>(result);
    }
  }

  static String truncateText(
    String text, {
    int maxLength = 30,
    String omission = '...',
  }) {
    if (maxLength <= 0) return '';
    if (text.length <= maxLength) return text;
    if (maxLength <= omission.length) {
      return omission.substring(0, maxLength);
    }

    return '${text.substring(0, maxLength - omission.length)}$omission';
  }

  static String capitalize(String value) {
    final trimmedValue = value.trim();

    if (trimmedValue.isEmpty) return '';

    return trimmedValue[0].toUpperCase() + trimmedValue.substring(1);
  }

  static bool isNullOrEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static List<T> removeDuplicates<T>(List<T> items) {
    return items.toSet().toList();
  }

  static double calculateTotalCost({
    required double subtotal,
    String? location,
    CountryLocale countryLocale = CountryLocale.th,
    double discount = 0,
    double? shippingCost,
    double? taxRate,
  }) {
    final taxableSubtotal = _positive(subtotal - discount);
    final resolvedShippingCost = shippingCost ??
        calculateShippingCost(
          taxableSubtotal,
          countryLocale: countryLocale,
        );
    final taxAmount = calculateTax(
      taxableSubtotal,
      location: location,
      countryLocale: countryLocale,
      taxRate: taxRate,
    );

    return _roundMoney(taxableSubtotal + resolvedShippingCost + taxAmount);
  }

  static double calculateShippingCost(
    double subtotal, {
    CountryLocale countryLocale = CountryLocale.th,
    double? shippingCost,
    double? freeShippingThreshold,
  }) {
    if (shippingCost != null) return _roundMoney(_positive(shippingCost));

    final resolvedThreshold =
        freeShippingThreshold ?? _getFreeShippingThreshold(countryLocale);

    if (_positive(subtotal) >= resolvedThreshold) return 0;

    return _roundMoney(_getDefaultShippingCost(countryLocale));
  }

  static double calculateTax(
    double subtotal, {
    String? location,
    CountryLocale countryLocale = CountryLocale.th,
    double? taxRate,
  }) {
    final resolvedTaxRate = taxRate ??
        getTaxRateByLocation(
          location,
          countryLocale: countryLocale,
        );

    return _roundMoney(_positive(subtotal) * resolvedTaxRate);
  }

  static double getTaxRateByLocation(
    String? location, {
    CountryLocale countryLocale = CountryLocale.th,
  }) {
    final normalizedLocation = location?.trim().toLowerCase();

    if (countryLocale == CountryLocale.th ||
        normalizedLocation == 'th' ||
        normalizedLocation == 'thailand') {
      return _thailandTaxRate;
    }

    return 0;
  }

  static double _getDefaultShippingCost(CountryLocale countryLocale) {
    return switch (countryLocale) {
      CountryLocale.th => _defaultThailandShippingCost,
      CountryLocale.us => _defaultUnitedStatesShippingCost,
    };
  }

  static double _getFreeShippingThreshold(CountryLocale countryLocale) {
    return switch (countryLocale) {
      CountryLocale.th => _defaultThailandFreeShippingThreshold,
      CountryLocale.us => _defaultUnitedStatesFreeShippingThreshold,
    };
  }

  static double _positive(double value) {
    return value < 0 ? 0 : value;
  }

  static double _roundMoney(double value) {
    return double.parse(value.toStringAsFixed(2));
  }
}
