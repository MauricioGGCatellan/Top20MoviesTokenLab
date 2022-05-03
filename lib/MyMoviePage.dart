import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMoviePage extends StatefulWidget {
  @override
  State<MyMoviePage> createState() => _MyMoviePageState();
}

class _MyMoviePageState extends State<MyMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filme'),
        ),
        body: Center(
            child: Column(children: [
          Container(
            height: 30,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text('Data de lancamento'),
            ),
          ),
          Container(
            height: 30,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text('Produtores'),
            ),
          ),
          Container(
            height: 30,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text('Gêneros'),
            ),
          ),
          Container(
            width: 1000,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text('Sinopse'),
            ),
          ),
        ])));
  }
}
