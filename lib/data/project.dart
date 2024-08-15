class Project {
   Project({
    required this.name,
    required this.description,
    this.githubRepo = '',
    this.liveLink = '',
    this.tags = const [],
    this.imgUrl = '',
    this.ytUrl = '',
    this.documentationUrl = '',
  });


  final String name;
  final String description;
  final String githubRepo;
  final String liveLink;
  final List tags;
  final String imgUrl;
  final String ytUrl;
  final String documentationUrl;
}
