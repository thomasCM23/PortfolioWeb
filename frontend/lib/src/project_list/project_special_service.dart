import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'project.dart';
import 'projects/text_gen/text_gen_component.dart';

class ProjectSpecialService {
  static const _mainURL = 'http://localhost:5000'; // URL to web API
  static const _projectSpecialURL = _mainURL + '/projects/ml_projects';
  static const _generateURL = _mainURL + '/generate-text';
  static const _translateURL = _mainURL + '/translate-text';
  static final _headers = {'Content-Type': 'application/json'};
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

  Future<String> generateText(GenerateForm form) async{
    try{
      final response = await _http.post(_generateURL, headers: _headers, body: json.encode(form));
      print(_extractData(response)['text']);
      return _extractData(response)['text'];
    } catch(e){
      throw _handleError(e);
    }
  }
  Future<String> translateText() async{
    try{
      final response = await _http.get(_translateURL);
      print(response);
    } catch(e){
      throw _handleError(e);
    }
  }
}
