// ignore_for_file: deprecated_member_use

import 'package:best_movies/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'App_Widget.dart';
import 'movie_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();

  _success() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        var movieInfo = controller.formatting(index);
        return ListTile(
          title: CustomRow(info: movieInfo),
        );
      },
    );
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
              controller.start();
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

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
      default:
        return _loading();
    }
  }

  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
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

class CustomRow extends StatelessWidget {
  final Map<String, String> info;

  const CustomRow({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/movie', arguments: info['id']);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 250,
              decoration: BoxDecoration(
                color: Color.fromARGB(210, 253, 213, 93),
                border: Border.all(
                  color: Colors.brown,
                  width: 1,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(info['ranking']!,
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              ),
            ),
            /*Container(
              height: 100,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(info[1]),
              ),
            ),*/
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 300, //250,
              decoration: BoxDecoration(
                color: Color.fromARGB(210, 253, 213, 93),
                border: Border.all(
                  color: Colors.brown,
                  width: 1,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(info['title']!),
              ),
            ),
          ],
        ));
  }
}
