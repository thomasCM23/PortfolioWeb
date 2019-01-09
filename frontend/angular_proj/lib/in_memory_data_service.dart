import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'src/project_list/project.dart';

class InMemoryDataService extends MockClient {
  static final _initialProjects = [
    {'id': 1, 'title': 'Dense Neural Net', 'description': 'Simple implementation of a Neural Network framework. Only meant for me to reinforce some of the knowledge I have gained about Neural Networks.', 'url': '', 'imagePath': 'card_densenet.png', 'tech': 'Python, Numpy'},
    {'id': 2, 'title': 'Human Protein Atlas Image Classification', 'description': 'Develop models capable of classifying mixed patterns of proteins in microscope images', 'url': '', 'imagePath': 'ProjectDiscoveryProtein.jpg', 'tech': 'Python, Tensorflow'},
    {'id': 2, 'title': 'Neural Style Transfer', 'description': 'Transform the content images to the style of another image, using convolutional neural nets.', 'url': '', 'imagePath': 'card_neuraltransfer.png', 'tech': 'Python, Tensorflow, Keras'},
    {'id': 2, 'title': 'Eng to French ML App (Future)', 'description': 'Using deep recurrent neural network for machine transalation from engilish to french.', 'url': '', 'imagePath': 'flutter.png', 'tech': 'Python, Tensorflow, Flutter'},
    {'id': 4, 'title': 'Quick Notes (Future)', 'description': 'Application to take photes of notes and render them into digital, searchable e-notebooks.', 'url': '', 'imagePath': 'flutter.png', 'tech': 'Python, Tensorflow, Flutter, Go'},
  ];
  static List<Project> _projectsDb;
  static int _nextId;
  static Future<Response> _handler(Request request) async {
    if (_projectsDb == null) resetDb();
    var data;
    switch (request.method) {
      case 'GET':
        String prefix = request.url.queryParameters['title'] ?? '';
        final regExp = RegExp(prefix, caseSensitive: false);
        data = _projectsDb.where((project) => project.title.contains(regExp)).toList();
        
        break;
      default:
        throw 'Unimplemented HTTP method ${request.method}';
    }
    return Response(json.encode({'data': data}), 200,
        headers: {'content-type': 'application/json'});
  }
  static resetDb() {
    _projectsDb = _initialProjects.map((json) => Project.fromJson(json)).toList();
    _nextId = _projectsDb.map((project) => project.id).fold(0, max) + 1;
  }
  static String lookUpName(int id) =>
      _projectsDb.firstWhere((project) => project.id == id, orElse: null)?.title;
  InMemoryDataService() : super(_handler);
}