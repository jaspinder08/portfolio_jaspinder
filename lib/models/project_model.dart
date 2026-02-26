class ProjectModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String? externalLink;
  final List<String> technologies;
  final String? githubLink;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.externalLink,
    required this.technologies,
    this.githubLink,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      externalLink: json['externalLink'] as String?,
      technologies: List<String>.from(json['technologies'] as List),
      githubLink: json['githubLink'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'externalLink': externalLink,
      'technologies': technologies,
      'githubLink': githubLink,
    };
  }
}
