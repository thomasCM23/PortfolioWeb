import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
  selector: 'my-home',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
    coreDirectives,
    routerDirectives
  ],
  styleUrls: [
    'home_component.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css'
  ],
  templateUrl: 'home_component.html',
)
class HomeComponent {}
