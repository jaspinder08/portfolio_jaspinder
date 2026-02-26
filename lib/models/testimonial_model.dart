class TestimonialModel {
  final String id;
  final String quote;
  final String authorName;
  final String authorTitle;
  final String? authorCompany;
  final String? authorImageUrl;

  const TestimonialModel({
    required this.id,
    required this.quote,
    required this.authorName,
    required this.authorTitle,
    this.authorCompany,
    this.authorImageUrl,
  });

  factory TestimonialModel.fromJson(Map<String, dynamic> json) {
    return TestimonialModel(
      id: json['id'] as String,
      quote: json['quote'] as String,
      authorName: json['authorName'] as String,
      authorTitle: json['authorTitle'] as String,
      authorCompany: json['authorCompany'] as String?,
      authorImageUrl: json['authorImageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quote': quote,
      'authorName': authorName,
      'authorTitle': authorTitle,
      'authorCompany': authorCompany,
      'authorImageUrl': authorImageUrl,
    };
  }
}
