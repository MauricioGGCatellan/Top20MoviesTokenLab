// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controllers/movie_controller.dart';

class MyMoviePage extends StatefulWidget {
  final id;

  MyMoviePage(this.id);

  @override
  State<MyMoviePage> createState() {
    return _MyMoviePageState(id);
  }
}

class _MyMoviePageState extends State<MyMoviePage> {
  final controller = MovieController();
  final id;

  _MyMoviePageState(this.id);

  _success() {
    Map<String, String> info = controller.formatting();

    return Center(
        child: Column(children: [
      Container(
        height: 30,
        width: 500,
        decoration: BoxDecoration(
          color: Color.fromARGB(210, 253, 213, 93),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(info['title']!),
        ),
      ),
      Image.network(
        info['posterUrl']!,
        errorBuilder: ((context, error, stackTrace) =>
            Image.asset('assets/images/place_holder.png')),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      Container(
        height: 30,
        width: 500,
        decoration: BoxDecoration(
          color: Color.fromARGB(210, 253, 213, 93),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(info['releaseDate']!),
        ),
      ),
      Container(
        height: 30,
        width: 500,
        decoration: BoxDecoration(
          color: Color.fromARGB(210, 253, 213, 93),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(info['originalLanguage']!),
        ),
      ),
      Container(
        height: 30,
        width: 500,
        decoration: BoxDecoration(
          color: Color.fromARGB(210, 253, 213, 93),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(info['popularity']!),
        ),
      ),
      SingleChildScrollView(
          child: Container(
        //height: MediaQuery.of(context).size.height,
        width: 1000,
        decoration: BoxDecoration(
          color: Color.fromARGB(210, 253, 213, 93),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            info['overview']!,
            style: TextStyle(fontSize: 18),
          ),
        ),
      )),
    ]));
  }

  _error() {
    return Column(
      children: [
        SizedBox(
          height: 300,
        ),
        Center(
          child: Text("Problema de Conexão!"),
        ),
        SizedBox(
          height: 100,
        ),
        Center(
          child: RaisedButton(
            onPressed: () {
              controller.start(id);
            },
            child: Text('Tentar novamente'),
          ),
        ),
      ],
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  stateManagement(MovieState state) {
    switch (state) {
      case MovieState.loading:
        return _loading();
      case MovieState.error:
        return _error();
      case MovieState.success:
        return _success();
      default:
        return _loading();
    }
  }

  void initState() {
    super.initState();
    controller.start(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Filme'),
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
