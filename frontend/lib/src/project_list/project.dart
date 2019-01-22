class Project {
  String title;
  String description;
  String url;
  String imagePath;
  String tech;
  Project(this.title, this.description,this.url, this.imagePath, this.tech);
  factory Project.fromJson(Map<dynamic, dynamic> project) =>
      Project(project['title'], project['description'], project['url'], project['imagePath'], project['tech']);
      
  Map toJson() => {
    'title': title,
    'description': description,
    'url': url,
    'imagePath': imagePath,
    'tech': tech
    };
}