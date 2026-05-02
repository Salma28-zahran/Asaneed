import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/hadith_details_model.dart';

class HadithDetailsService {
  static Future<HadithDetailsModel> fetchHadithDetails(int id) async {
    final response = await http.get(
      Uri.parse("http://167.99.94.194:8000/api/v1/hadith/hadiths/$id/"),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return HadithDetailsModel.fromJson(jsonData);
    } else {
      throw Exception("Failed to load hadith details");
    }
  }
}