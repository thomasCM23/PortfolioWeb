import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../../../route_paths.dart';
import '../../../routes.dart';

@Component(
  selector: 'project-quick-notes',
  styleUrls: [
    'quick_notes_component.css',
    'package:angular_components/app_layout/layout.scss.css'
  ],
  templateUrl: 'quick_notes_component.html',
  directives: [coreDirectives, routerDirectives],
  exports: [RoutePaths, Routes],
)
class QuickNotesComponent {
  
}
