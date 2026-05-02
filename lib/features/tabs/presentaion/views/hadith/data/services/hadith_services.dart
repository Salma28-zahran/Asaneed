import 'dart:convert';
import 'package:asaneed/features/tabs/presentaion/views/hadith/data/models/hadith_model.dart';
import 'package:http/http.dart' as http;
import '../../../../../../../core/network/endpoints.dart';

class HadithService {
  static Future<List<HadithModel>> fetchHadith() async {
    final response = await http.get(
        Uri.parse(Endpoints.hadith)
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];

      return results.map((e) => HadithModel.fromJson(e)).toList();
    } else {
      throw Exception("Error");
    }
  }
}