import 'package:ecommerce_flutter/utils/constants/enums.dart';

class ValidatorUtils {
  ValidatorUtils._();

  static String? validateRequired(
    String? value, {
    String fieldName = 'This field',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    final requiredError = validateRequired(value, fieldName: 'Email');
    if (requiredError != null) return requiredError;

    final email = value!.trim();
    final emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,}$');

    if (!emailRegex.hasMatch(email)) return 'Enter a valid email address';

    return null;
  }

  static String? validatePassword(
    String? value, {
    int minLength = 8,
  }) {
    final requiredError = validateRequired(value, fieldName: 'Password');
    if (requiredError != null) return requiredError;

    final password = value!;

    if (password.length < minLength) {
      return 'Password must be at least $minLength characters';
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String password,
  ) {
    final requiredError =
        validateRequired(value, fieldName: 'Confirm password');
    if (requiredError != null) return requiredError;

    if (value != password) return 'Passwords do not match';

    return null;
  }

  static String? validatePhoneNumber(
    String? value, {
    CountryLocale countryLocale = CountryLocale.th,
  }) {
    final requiredError = validateRequired(value, fieldName: 'Phone number');
    if (requiredError != null) return requiredError;

    final digits = value!.replaceAll(RegExp(r'\D'), '');

    return switch (countryLocale) {
      CountryLocale.th => _validateThaiPhoneNumber(digits),
      CountryLocale.us => _validateUsPhoneNumber(digits),
    };
  }

  static String? _validateThaiPhoneNumber(String digits) {
    if (digits.length == 10 && digits.startsWith('0')) return null;
    if (digits.length == 11 && digits.startsWith('66')) return null;

    return 'Enter a valid Thai phone number';
  }

  static String? _validateUsPhoneNumber(String digits) {
    if (digits.length == 10) return null;
    if (digits.length == 11 && digits.startsWith('1')) return null;

    return 'Enter a valid US phone number';
  }
}
