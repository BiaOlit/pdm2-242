import 'dart:convert';
import 'package:http/http.dart' as http;

class APIPaises {
  static const String baseUrl = 'https://restcountries.com/v3.1/all';

  Future<List<Map<String, dynamic>>> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        return data
            .where((country) => country['region'] == 'Americas' &&
                country['subregion'] == 'South America')
            .map((country) {
          return {
            'name': country['name']?['common'] ?? 'N/A',
            'flag': country['flags']?['png'] ?? 'N/A',
            'languages': country['languages'] != null
                ? country['languages'].values.join(', ')
                : 'N/A',
            'population': country['population']?.toString() ?? 'N/A',
            'region': country['region'] ?? 'N/A',
            'subregion': country['subregion'] ?? 'N/A',
            'capital': country['capital'] != null ? country['capital'][0] : 'N/A',
            'currency': country['currencies'] != null
                ? country['currencies'].values.first['name'] +
                    ' (${country['currencies'].values.first['symbol']})'
                : 'N/A',
          };
        }).toList();
      } else {
        throw Exception('Falha ao carregar países');
      }
    } catch (e) {
      print("Erro ao obter dados: $e");
      throw Exception('Erro ao obter dados');
    }
  }
}
