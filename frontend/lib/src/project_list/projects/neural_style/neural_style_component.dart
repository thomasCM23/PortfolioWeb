import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../../../route_paths.dart';
import '../../../routes.dart';
import 'package:ng_bootstrap/ng_bootstrap.dart';

@Component(
  selector: 'project-neural-style',
  styleUrls: [
    'neural_style_component.css',
    'package:angular_components/app_layout/layout.scss.css'
  ],
  templateUrl: 'neural_style_component.html',
  directives: [coreDirectives, routerDirectives, bsCarouselComponents],
  exports: [RoutePaths, Routes],
)
class NeuralStyleComponent {
  num myIntervalInSeconds = 4;
  num get myIntervalInMs => myIntervalInSeconds * 1000;
  bool noWrapSlides = false;
  
  List slides = [];
  NeuralStyleComponent() {
    slides.add({'image': 'images/slideshow_01.png'});
    slides.add({'image': 'images/slideshow_02.png'});
    slides.add({'image': 'images/slideshow_03.png'});
    slides.add({'image': 'images/slideshow_04.png'});
    slides.add({'image': 'images/slideshow_05.png'});
    slides.add({'image': 'images/slideshow_06.png'});
  }
}
