import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/legal_progress.dart';

class ApiService {
  static const String _url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<LegalProgress>> fetchLegalProgress() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode != 200) {
      throw Exception('Gagal mengambil data dari API');
    }

    final List<dynamic> jsonData = jsonDecode(response.body);

    const percentages = [20, 35, 50, 60, 70, 80, 90, 100, 45, 75];

    return jsonData.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value as Map<String, dynamic>;
      final percentage = percentages[index % percentages.length];

      return LegalProgress(
        id: item['id'] as int,
        companyName: 'PT ${item['company']['name']}',
        clientName: item['name'] as String,
        email: item['email'] as String,
        percentage: percentage,
        status: _statusFromPercentage(percentage),
      );
    }).toList();
  }

  static String _statusFromPercentage(int percentage) {
    if (percentage >= 100) return 'Selesai';
    if (percentage >= 70) return 'Tahap Persetujuan';
    if (percentage >= 40) return 'Penyusunan Dokumen';
    return 'Konsultasi Awal';
  }
}
