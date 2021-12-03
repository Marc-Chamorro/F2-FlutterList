import 'package:flutter/material.dart';
import 'dart:async';
import 'digimon_model.dart';
import 'digimon_list.dart';
import 'new_digimon_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Best Fast Foods',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Best Fast Foods',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Digimon> initialFastFoods = []..add(Digimon('Croquetes'))..add(Digimon('Kebab'))..add(Digimon('Hamburguesa'))..add(Digimon('Pizza'));

  Future _showNewDigimonForm() async {
    Digimon newDigimon = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return AddDigimonFormPage();
    }));
    //print(newDigimon);
    if (newDigimon != null) {
      initialFastFoods.add(newDigimon);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    //field.reset(); fix this
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: new Text(widget.title, style: TextStyle(color: Color.fromARGB(255, 239, 242, 221))),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 234, 28, 34),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDigimonForm,
          ),
        ],
      ),
      body: new Container(
          color: Color.fromARGB(255, 108, 134, 153),
          child: new Center(
            child: new DigimonList(initialFastFoods),
          )),
    );
  }
}
