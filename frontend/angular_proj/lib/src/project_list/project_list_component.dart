import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'project_special_service.dart';
import 'project.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
  selector: 'my-projects',
  styleUrls: [
    'project_list_component.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
  ],
  templateUrl: 'project_list_component.html',
  directives: [
    coreDirectives,
    routerDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
  ],
  providers: [ClassProvider(ProjectSpecialService)],
)
class ProjectListComponent implements OnInit {
  final ProjectSpecialService _projectSpecialService;
  final Router _router;

  List<Project> projectsSpecial;

  ProjectListComponent(this._projectSpecialService, this._router);

  Future<void> _getSpecialProjects() async {
    projectsSpecial = await _projectSpecialService.getAll();
  }

  void ngOnInit() {
    _getSpecialProjects();
  }
}
