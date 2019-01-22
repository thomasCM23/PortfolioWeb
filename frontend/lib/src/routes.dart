import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'home/home_component.template.dart' as home_template;
import 'project_list/project_list_component.template.dart' as project_list_template;
import 'project_list/projects/neural_style/neural_style_component.template.dart' as neural_style_template;
import 'project_list/projects/dense_net/dense_net_component.template.dart' as dense_net_template;
import 'project_list/projects/protein_class/protein_class_component.template.dart' as protein_class_template;
import 'project_list/projects/quick_notes/quick_notes_component.template.dart' as quick_notes_template;
import 'project_list/projects/text_gen/text_gen_component.template.dart' as text_gen_template;
import 'project_list/projects/translation_app/translation_app_component.template.dart' as translation_app_template;

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

  static final denseNet = RouteDefinition(
    routePath: RoutePaths.denseNet,
    component: dense_net_template.DenseNetComponentNgFactory,
  );

  static final proteinClass = RouteDefinition(
    routePath: RoutePaths.proteinClass,
    component: protein_class_template.ProteinClassComponentNgFactory,
  );

  static final quickNotes = RouteDefinition(
    routePath: RoutePaths.quickNotes,
    component: quick_notes_template.QuickNotesComponentNgFactory,
  );

  static final textGen = RouteDefinition(
    routePath: RoutePaths.textgGen,
    component: text_gen_template.TextGenComponentNgFactory,
  );

  static final translationApp = RouteDefinition(
    routePath: RoutePaths.translationApp,
    component: translation_app_template.TranslationAppComponentNgFactory,
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
