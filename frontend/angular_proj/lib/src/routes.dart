import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'home/home_component.template.dart' as home_template;
import 'project_list/project_list_component.template.dart' as project_list_template;
import 'project_list/projects/neural_style/neural_style_component.template.dart' as neural_style_template;
//import 'project_list/projects/' as project_detail_template;

export 'route_paths.dart';

class Routes {
  static final home = RouteDefinition(
    routePath: RoutePaths.home,
    component: home_template.HomeComponentNgFactory,
  );

  static final projects = RouteDefinition(
    routePath: RoutePaths.projects,
    component: project_list_template.ProjectListComponentNgFactory,
  );

  static final neuralStyle = RouteDefinition(
    routePath: RoutePaths.neuralStyle,
    component: neural_style_template.NeuralStyleComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    home,
    projects,
    neuralStyle,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.home.toUrl(),
    ),
  ];
}
