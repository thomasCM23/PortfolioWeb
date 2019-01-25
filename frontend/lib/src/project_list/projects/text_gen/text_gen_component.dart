import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_input_multiline.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_tooltip/material_tooltip.dart';
import 'package:angular_forms/angular_forms.dart';
import '../../../route_paths.dart';
import '../../../routes.dart';
import '../../project_special_service.dart';

@Component(
  selector: 'project-text-gen',
  styleUrls: [
    'text_gen_component.scss.css',
    'package:angular_components/app_layout/layout.scss.css'
  ],
  templateUrl: 'text_gen_component.html',
  directives: [
    formDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
    materialInputDirectives,
    MaterialMultilineInputComponent,
    materialNumberInputDirectives,
    MaterialPaperTooltipComponent,
    MaterialTooltipTargetDirective,
    coreDirectives,
    routerDirectives,
  ],
  providers: [ClassProvider(ProjectSpecialService),],
  exports: [RoutePaths, Routes],
  preserveWhitespace: true,
)
class TextGenComponent {
  GenerateForm form = GenerateForm("Hello", 10000, 1, "");
  final ProjectSpecialService _projectService;

  TextGenComponent(this._projectService);

  Future<void> generate() async {
    form.generatedText = await _projectService.generateText(form);
  }
}

class GenerateForm {
  String word;
  int length;
  int temperature;
  String generatedText;
  GenerateForm(this.word, this.length, this.temperature, this.generatedText);
  Map toJson() => {
        'word': word,
        'length': length,
        'temperature': temperature,
        'generatedText': generatedText
      };
}
