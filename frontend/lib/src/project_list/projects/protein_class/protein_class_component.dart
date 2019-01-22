import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../../../route_paths.dart';
import '../../../routes.dart';

@Component(
  selector: 'project-protein-class',
  styleUrls: [
    'protein_class_component.css',
    'package:angular_components/app_layout/layout.scss.css'
  ],
  templateUrl: 'protein_class_component.html',
  directives: [coreDirectives, routerDirectives],
  exports: [RoutePaths, Routes],
)
class ProteinClassComponent {
  
}
