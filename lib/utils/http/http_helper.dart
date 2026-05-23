import 'dart:async';
import 'dart:convert';

import 'package:ecommerce_flutter/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  HttpHelper._();

  static final http.Client _client = http.Client();

  static Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? token,
  }) {
    return _sendRequest(
      () => _client.get(
        _buildUri(endpoint, queryParameters: queryParameters),
        headers: _buildHeaders(headers: headers, token: token),
      ),
    );
  }

  static Future<dynamic> post(
    String endpoint, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? token,
  }) {
    return _sendRequest(
      () => _client.post(
        _buildUri(endpoint, queryParameters: queryParameters),
        headers: _buildHeaders(headers: headers, token: token),
        body: _encodeBody(body),
      ),
    );
  }

  static Future<dynamic> put(
    String endpoint, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? token,
  }) {
    return _sendRequest(
      () => _client.put(
        _buildUri(endpoint, queryParameters: queryParameters),
        headers: _buildHeaders(headers: headers, token: token),
        body: _encodeBody(body),
      ),
    );
  }

  static Future<dynamic> patch(
    String endpoint, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? token,
  }) {
    return _sendRequest(
      () => _client.patch(
        _buildUri(endpoint, queryParameters: queryParameters),
        headers: _buildHeaders(headers: headers, token: token),
        body: _encodeBody(body),
      ),
    );
  }

  static Future<dynamic> delete(
    String endpoint, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? token,
  }) {
    return _sendRequest(
      () => _client.delete(
        _buildUri(endpoint, queryParameters: queryParameters),
        headers: _buildHeaders(headers: headers, token: token),
        body: _encodeBody(body),
      ),
    );
  }

  static Uri _buildUri(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    final baseUrl = ApiConstants.baseUrl.endsWith('/')
        ? ApiConstants.baseUrl
        : '${ApiConstants.baseUrl}/';
    final normalizedEndpoint =
        endpoint.startsWith('/') ? endpoint.substring(1) : endpoint;
    final uri = Uri.parse(baseUrl).resolve(normalizedEndpoint);
    final cleanQueryParameters = _cleanQueryParameters(queryParameters);

    if (cleanQueryParameters.isEmpty) return uri;

    return uri.replace(
      queryParameters: {
        ...uri.queryParameters,
        ...cleanQueryParameters,
      },
    );
  }

  static Map<String, String> _buildHeaders({
    Map<String, String>? headers,
    String? token,
  }) {
    final trimmedToken = token?.trim();

    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (trimmedToken != null && trimmedToken.isNotEmpty)
        'Authorization': 'Bearer $trimmedToken',
      ...?headers,
    };
  }

  static Map<String, String> _cleanQueryParameters(
    Map<String, dynamic>? queryParameters,
  ) {
    if (queryParameters == null || queryParameters.isEmpty) return {};

    return {
      for (final entry in queryParameters.entries)
        if (entry.value != null) entry.key: entry.value.toString(),
    };
  }

  static Object? _encodeBody(Object? body) {
    if (body == null || body is String) return body;

    return jsonEncode(body);
  }

  static Future<dynamic> _sendRequest(
    Future<http.Response> Function() request,
  ) async {
    try {
      final response = await request().timeout(ApiConstants.receiveTimeout);

      return _handleResponse(response);
    } on TimeoutException {
      throw const ApiException('Request timed out');
    } on http.ClientException catch (error) {
      throw ApiException(error.message);
    } on FormatException catch (error) {
      throw ApiException(error.message);
    }
  }

  static dynamic _handleResponse(http.Response response) {
    final data = _decodeResponse(response);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }

    throw ApiException(
      _extractErrorMessage(data) ?? response.reasonPhrase ?? 'Request failed',
      statusCode: response.statusCode,
      data: data,
    );
  }

  static dynamic _decodeResponse(http.Response response) {
    if (response.body.isEmpty) return null;

    try {
      return jsonDecode(response.body);
    } on FormatException {
      return response.body;
    }
  }

  static String? _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? data['error'];

      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
    }

    if (data is String && data.trim().isNotEmpty) return data;

    return null;
  }
}

class ApiException implements Exception {
  const ApiException(
    this.message, {
    this.statusCode,
    this.data,
  });

  final String message;
  final int? statusCode;
  final dynamic data;

  @override
  String toString() {
    if (statusCode == null) return 'ApiException: $message';

    return 'ApiException($statusCode): $message';
  }
}
