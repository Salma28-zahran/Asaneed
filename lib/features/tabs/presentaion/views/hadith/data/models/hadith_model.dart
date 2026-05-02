class HadithModel {
  final String number;
  final String text;
  final String status;
  final int id;

  HadithModel({
    required this.number,
    required this.text,
    required this.status,
    required this.id,

  });

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      number: json['code'].toString(),
      text: json['source'] ?? "",
      status: _mapStatus(json['status']),
      id: json['id'],
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