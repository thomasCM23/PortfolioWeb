import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/route_paths.dart';
import 'src/routes.dart';
import 'src/header/header_component.dart';
import 'src/home/home_component.dart';
import 'src/project_list/project_list_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  template: '''
    <header-outlet></header-outlet>
    <div class="main">
      <router-outlet [routes]="Routes.all"></router-outlet>
    </div>
    <footer-outlet></footer-outlet>
  ''',
  directives: [routerDirectives, HeaderComponent, HomeComponent, ProjectListComponent],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
