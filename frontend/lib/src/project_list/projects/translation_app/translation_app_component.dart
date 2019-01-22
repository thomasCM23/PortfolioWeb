import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../../../route_paths.dart';
import '../../../routes.dart';

@Component(
  selector: 'project-translation-app',
  styleUrls: [
    'translation_app_component.css',
    'package:angular_components/app_layout/layout.scss.css'
  ],
  templateUrl: 'translation_app_component.html',
  directives: [coreDirectives, routerDirectives],
  exports: [RoutePaths, Routes],
)
class TranslationAppComponent {
  
}
