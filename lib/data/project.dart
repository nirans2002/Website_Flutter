class Project {
  Project({
    required this.name,
    required this.description,
    required this.tags,
    this.githubRepo,
    this.liveLink,
    this.imgUrl,
    this.ytUrl,
    this.documentationUrl,
  });

  final String name;
  final String description;
  final String? githubRepo;
  final String? liveLink;
  final List tags;
  final String? imgUrl;
  final String? ytUrl;
  final String? documentationUrl;
}
