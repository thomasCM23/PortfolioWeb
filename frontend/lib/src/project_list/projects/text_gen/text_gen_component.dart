import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../../../route_paths.dart';
import '../../../routes.dart';

@Component(
  selector: 'project-text-gen',
  styleUrls: [
    'text_gen_component.css',
    'package:angular_components/app_layout/layout.scss.css'
  ],
  templateUrl: 'text_gen_component.html',
  directives: [coreDirectives, routerDirectives],
  exports: [RoutePaths, Routes],
)
class TextGenComponent {
  
}
