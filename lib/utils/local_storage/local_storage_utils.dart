import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageUtils {
  LocalStorageUtils._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> save<T>(String key, T value) async {
    await _storage.write(
      key: key,
      value: _encodeValue(value),
    );
  }

  static Future<T?> read<T>(String key) async {
    final value = await _storage.read(key: key);

    if (value == null) return null;

    return _decodeValue<T>(value);
  }

  static Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }

  static String _encodeValue<T>(T value) {
    if (value is String) return value;
    if (value is num || value is bool) return value.toString();

    return jsonEncode(value);
  }

  static T? _decodeValue<T>(String value) {
    if (T == String) return value as T;

    if (T == bool) {
      return switch (value.trim().toLowerCase()) {
        'true' => true as T,
        'false' => false as T,
        _ => null,
      };
    }

    if (T == int) return int.tryParse(value) as T?;
    if (T == double) return double.tryParse(value) as T?;
    if (T == num) return num.tryParse(value) as T?;

    try {
      final decodedValue = jsonDecode(value);

      if (decodedValue is T) return decodedValue;
    } on FormatException {
      return null;
    }

    return null;
  }
}
