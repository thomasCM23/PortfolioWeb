import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../../../route_paths.dart';
import '../../../routes.dart';

@Component(
  selector: 'project-neural-style',
  styleUrls: [
    'dense_net_component.css',
    'package:angular_components/app_layout/layout.scss.css'
  ],
  templateUrl: 'dense_net_component.html',
  directives: [coreDirectives, routerDirectives],
  exports: [RoutePaths, Routes],
)
class DenseNetComponent {
 
}
