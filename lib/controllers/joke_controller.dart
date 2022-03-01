import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:random_joke_generator/models/joke_model.dart';

class JokeController extends ChangeNotifier {
  Future<JokesModel> getData(context) async {
    var url = 'https://api.chucknorris.io/jokes/random';

    var modelData;
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        modelData = JokesModel.fromJson(data);

        notifyListeners();
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print(e.toString());
    }

    return modelData!;
  }
}
