import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'project.dart';

class ProjectGitService {
  static const _mainURL = 'http://localhost:5000'; // URL to web API
  static const _gitSpecialURL = _mainURL + '/projects/git_projects';

  final Client _http;

  ProjectGitService(this._http);

  Future<List<Project>> getAll() async {
    try {
      final response = await _http.get(_gitSpecialURL);
      print(response.body);
      final heroes = (_extractData(response) as List)
          .map((json) => Project.fromJson(json))
          .toList();
      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body);

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
    
}
