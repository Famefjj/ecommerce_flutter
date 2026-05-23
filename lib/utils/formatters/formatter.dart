import 'package:ecommerce_flutter/utils/constants/enums.dart';
import 'package:intl/intl.dart';

class Formatter {
  Formatter._();

  static String formatDate(
    DateTime? date, {
    String pattern = 'dd-MMM-yyyy',
    CountryLocale countryLocale = CountryLocale.th,
  }) {
    if (date == null) return '';

    return DateFormat(pattern, countryLocale.localeCode).format(date);
  }

  static String formatTime(
    DateTime? time, {
    String pattern = 'hh:mm a',
    CountryLocale countryLocale = CountryLocale.th,
  }) {
    if (time == null) return '';

    return DateFormat(pattern, countryLocale.localeCode).format(time);
  }

  static String formatDateTime(
    DateTime? dateTime, {
    String pattern = 'dd-MMM-yyyy, hh:mm a',
    CountryLocale countryLocale = CountryLocale.th,
  }) {
    if (dateTime == null) return '';

    return DateFormat(pattern, countryLocale.localeCode).format(dateTime);
  }

  static String formatCurrency(
    num? amount, {
    CountryLocale countryLocale = CountryLocale.th,
    int decimalDigits = 2,
  }) {
    if (amount == null) return '';

    return NumberFormat.currency(
      locale: countryLocale.localeCode,
      symbol: countryLocale.currencySymbol,
      decimalDigits: decimalDigits,
    ).format(amount);
  }

  static String formatNumber(
    num? value, {
    CountryLocale countryLocale = CountryLocale.th,
    int? decimalDigits,
  }) {
    if (value == null) return '';

    final formatter = NumberFormat.decimalPattern(countryLocale.localeCode);

    if (decimalDigits != null) {
      formatter.minimumFractionDigits = decimalDigits;
      formatter.maximumFractionDigits = decimalDigits;
    }

    return formatter.format(value);
  }

  static String formatCompactNumber(
    num? value, {
    CountryLocale countryLocale = CountryLocale.th,
  }) {
    if (value == null) return '';

    return NumberFormat.compact(locale: countryLocale.localeCode).format(value);
  }

  static String formatPercentage(
    num? value, {
    CountryLocale countryLocale = CountryLocale.th,
    int decimalDigits = 0,
  }) {
    if (value == null) return '';

    final formatter = NumberFormat.decimalPattern(countryLocale.localeCode)
      ..minimumFractionDigits = decimalDigits
      ..maximumFractionDigits = decimalDigits;

    return '${formatter.format(value)}%';
  }

  static String formatPhoneNumber(
    String? phoneNumber, {
    CountryLocale countryLocale = CountryLocale.th,
  }) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) return '';

    final trimmedPhoneNumber = phoneNumber.trim();
    final digits = _digitsOnly(trimmedPhoneNumber);

    return switch (countryLocale) {
      CountryLocale.th => _formatThaiPhoneNumber(
          digits,
          trimmedPhoneNumber,
        ),
      CountryLocale.us => _formatUsPhoneNumber(
          digits,
          trimmedPhoneNumber,
        ),
    };
  }

  static String formatCreditCardNumber(String? cardNumber) {
    if (cardNumber == null || cardNumber.trim().isEmpty) return '';

    final digits = _digitsOnly(cardNumber);
    final groups = <String>[];

    for (var index = 0; index < digits.length; index += 4) {
      final end = (index + 4 < digits.length) ? index + 4 : digits.length;
      groups.add(digits.substring(index, end));
    }

    return groups.join(' ');
  }

  static String maskCreditCardNumber(String? cardNumber) {
    if (cardNumber == null || cardNumber.trim().isEmpty) return '';

    final digits = _digitsOnly(cardNumber);

    if (digits.length <= 4) return digits;

    final visibleDigits = digits.substring(digits.length - 4);
    return '**** **** **** $visibleDigits';
  }

  static String formatPostalCode(String? postalCode) {
    if (postalCode == null) return '';

    return postalCode.trim().toUpperCase();
  }

  static String _formatUsPhoneNumber(String digits, String fallback) {
    if (digits.length == 10) {
      return '(${digits.substring(0, 3)}) '
          '${digits.substring(3, 6)}-${digits.substring(6)}';
    }

    if (digits.length == 11 && digits.startsWith('1')) {
      return '+1 (${digits.substring(1, 4)}) '
          '${digits.substring(4, 7)}-${digits.substring(7)}';
    }

    return fallback;
  }

  static String _formatThaiPhoneNumber(String digits, String fallback) {
    final nationalDigits =
        digits.startsWith('66') ? '0${digits.substring(2)}' : digits;

    if (nationalDigits.length == 10) {
      return '${nationalDigits.substring(0, 3)} '
          '${nationalDigits.substring(3, 6)} '
          '${nationalDigits.substring(6)}';
    }

    if (nationalDigits.length == 9) {
      if (nationalDigits.startsWith('02')) {
        return '${nationalDigits.substring(0, 2)} '
            '${nationalDigits.substring(2, 5)} '
            '${nationalDigits.substring(5)}';
      }

      return '${nationalDigits.substring(0, 3)} '
          '${nationalDigits.substring(3, 6)} '
          '${nationalDigits.substring(6)}';
    }

    return fallback;
  }

  static String _digitsOnly(String value) {
    return value.replaceAll(RegExp(r'\D'), '');
  }
}
