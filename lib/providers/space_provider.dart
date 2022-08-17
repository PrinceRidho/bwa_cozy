import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var result = await http
        .get(Uri.http('https://bwa-cozy.herokuapp.com/recommended-spaces', ''));

    print(result.statusCode);
    print(result.body);
  }
}
