class SkillModel {
  final String name;
  final int proficiencyLevel; // 1-5 scale
  final String category;

  const SkillModel({
    required this.name,
    required this.proficiencyLevel,
    required this.category,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'] as String,
      proficiencyLevel: json['proficiencyLevel'] as int,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'proficiencyLevel': proficiencyLevel,
      'category': category,
    };
  }

  // Get proficiency text based on level
  String get proficiencyText {
    switch (proficiencyLevel) {
      case 1:
        return 'Beginner';
      case 2:
        return 'Elementary';
      case 3:
        return 'Intermediate';
      case 4:
        return 'Advanced';
      case 5:
        return 'Expert';
      default:
        return 'Unknown';
    }
  }
}
