import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'project.dart';

class ProjectSpecialService {
  static const _projectSpecialURL = 'http://localhost:5000' + '/projects/ml_projects'; // URL to web API

  final Client _http;

  ProjectSpecialService(this._http);

  Future<List<Project>> getAll() async {
    try {
      final response = await _http.get(_projectSpecialURL);
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
