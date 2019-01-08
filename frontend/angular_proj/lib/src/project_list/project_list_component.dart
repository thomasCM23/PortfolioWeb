import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-projects',
  styleUrls: [
    'project_list_component.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css'
  ],
  templateUrl: 'project_list_component.html',
  directives: [coreDirectives, routerDirectives],
)
class ProjectListComponent {}
