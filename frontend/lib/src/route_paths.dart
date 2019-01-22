import 'package:angular_router/angular_router.dart';

const idParam = 'id';

class RoutePaths {
  static final home = RoutePath(path: 'home');
  static final projects = RoutePath(path: 'projects');
  //static final additional = RoutePath(path: 'additional');
  //static final project = RoutePath(path: '${projects.path}/:$idParam');
  static final neuralStyle = RoutePath(path: 'neuralstyle');
  static final denseNet = RoutePath(path: 'densenet');
  static final proteinClass = RoutePath(path: 'proteinclass');
  static final textgGen = RoutePath(path: 'textgen');
  static final translationApp = RoutePath(path: 'translationapp');
  static final quickNotes = RoutePath(path: 'quicknotes');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
