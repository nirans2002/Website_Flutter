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
    this.startDate,
    this.endDate,
    this.otherContributors,
  });

  final String name;
  final String description;
  final String? githubRepo;
  final String? liveLink;
  final List tags;
  final String? imgUrl;
  final String? ytUrl;
  final String? documentationUrl;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<Contributor>? otherContributors;
}

class Contributor {
  final String name;
  final String linkedinProfileLink;
  Contributor({
    required this.name,
    required this.linkedinProfileLink,
  });
}
