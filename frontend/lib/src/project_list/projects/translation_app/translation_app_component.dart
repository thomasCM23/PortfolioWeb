import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../../../route_paths.dart';
import '../../../routes.dart';
import '../../project_special_service.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/material_button/material_button.dart';

@Component(
  selector: 'project-translation-app',
  styleUrls: [
    'translation_app_component.css',
    'package:angular_components/app_layout/layout.scss.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
  ],
  templateUrl: 'translation_app_component.html',
  directives: [coreDirectives, routerDirectives, formDirectives,MaterialButtonComponent],
  providers: [ClassProvider(ProjectSpecialService),],
  exports: [RoutePaths, Routes],
)
class TranslationAppComponent {
  TranslateForm form = TranslateForm("In the 80s in the twentieth century, Ireland was one of the poorest countries in the European Union, along with Portugal.", "");

  final ProjectSpecialService _projectService;

  TranslationAppComponent(this._projectService);

  Future<void> translate() async {
    form.transText = await _projectService.translateText(form);
  }
}

class TranslateForm{
  String original_text;
  String transText;
  TranslateForm(this.original_text, this.transText);
  Map toJson() => {
        'original_text': original_text,
        'transText': transText
      };
}