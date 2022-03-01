import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_joke_generator/controllers/joke_controller.dart';
import 'package:random_joke_generator/models/joke_model.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Joke Generator'),
        backgroundColor: Colors.redAccent,
      ),
      body: Consumer<JokeController>(builder: (context, value, _) {
        return FutureBuilder<JokesModel>(
            future: value.getData(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 16.0),
                  child: Column(
                    children: [
                      Image.network(
                        snapshot.data!.iconUrl,
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data!.id.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(snapshot.data!.value,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1)),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      }),
    );
  }
}
