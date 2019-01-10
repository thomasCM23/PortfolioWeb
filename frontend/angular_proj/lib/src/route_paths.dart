import 'package:angular_router/angular_router.dart';

const idParam = 'id';

class RoutePaths {
  static final home = RoutePath(path: 'home');
  static final projects = RoutePath(path: 'projects');
  //static final additional = RoutePath(path: 'additional');
  //static final project = RoutePath(path: '${projects.path}/:$idParam');
  static final neuralStyle = RoutePath(path: 'neuralStyle');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
