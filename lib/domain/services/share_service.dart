import 'dart:convert';

import 'package:circ/core/constant/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShareService {
  static Future<Map<String, dynamic>?> generateShareLink({
    required String id,
    required String type,
  }) async {
    try {
      final url = Uri.parse('${ApiPath.baseUrl}share/generate-link');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"type": type, "id": id}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = json.decode(response.body);
        if (jsonData['success']) {
          return jsonData['data'];
        }
      }
    } catch (e) {
      debugPrint('Error generating share link: $e');
    }
    return null;
  }
}
