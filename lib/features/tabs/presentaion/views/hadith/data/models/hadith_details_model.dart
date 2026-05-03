class HadithDetailsModel {
  final int id;
  final String code;
  final String text;
  final String status;
  final String source;
  final List<NarratorModel> narratorChain;
  HadithDetailsModel({
    required this.id,
    required this.code,
    required this.text,
    required this.status,
    required this.source,
    required this.narratorChain,
  });

  factory HadithDetailsModel.fromJson(Map<String, dynamic> json) {
    return HadithDetailsModel(
      id: json['id'],
      code: json['code'],
      text: json['text'],
      status: _mapStatus(json['status']),
      source: json['source'] ?? "",
      narratorChain: (json['narrator_chain'] as List? ?? [])
          .map((e) => NarratorModel.fromJson(e))
          .toList(),
    );
  }

  static String _mapStatus(String status) {
    switch (status) {
      case "sahih":
        return "صحيح";
      case "hasan":
        return "حسن";
      case "daif":
        return "ضعيف";
      default:
        return "غير معروف";
    }
  }
}
class NarratorModel {
  final int position;
  final String narratorName;

  NarratorModel({
    required this.position,
    required this.narratorName,
  });

  factory NarratorModel.fromJson(Map<String, dynamic> json) {
    return NarratorModel(
      position: json['position'],
      narratorName: json['narrator_name'],
    );
  }
}