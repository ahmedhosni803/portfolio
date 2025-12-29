class ProjectLink {
  final String title;
  final String? googlePlay;
  final String? appleStore;

  const ProjectLink({required this.title, this.googlePlay, this.appleStore});
}

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String? subtitle;
  final List<ProjectLink> links;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.subtitle,
    this.links = const [],
  });
}
