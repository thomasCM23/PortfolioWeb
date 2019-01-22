class Project {
  final int id;
  String title;
  String description;
  String url;
  String imagePath;
  String tech;
  Project(this.id, this.title, this.description,this.url, this.imagePath, this.tech);
  factory Project.fromJson(Map<String, dynamic> project) =>
      Project(_toInt(project['id']), project['title'], project['description'], project['url'], project['imagePath'], project['tech']);
      
  Map toJson() => {
    'id': id, 
    'title': title,
    'description': description,
    'url': url,
    'imagePath': imagePath,
    'tech': tech
    };
}
int _toInt(id) => id is int ? id : int.parse(id);