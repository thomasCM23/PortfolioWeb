import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'project.dart';

class ProjectGitService {
  //static const _projectGitURL = 'api/projects'; // URL to web API

  final Client _http;

  ProjectGitService(this._http);

  Future<List<Project>> getAll() async {}
    
}
