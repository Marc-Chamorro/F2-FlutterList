import 'package:food_app/digimon_model.dart';
import 'package:flutter/material.dart';


class AddDigimonFormPage extends StatefulWidget {
  @override
  _AddDigimonFormPageState createState() => new _AddDigimonFormPageState();
}

class _AddDigimonFormPageState extends State<AddDigimonFormPage> {
  TextEditingController nameController = new TextEditingController();

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: Color.fromARGB(255, 234, 28, 34),
        content: new Text('You forgot to insert the food name'),
      ));
    } else {
      var newDigimon = new Digimon(nameController.text);
      Navigator.of(context).pop(newDigimon);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add a new fast food'),
        backgroundColor: Color.fromARGB(255, 234, 28, 34),
      ),
      body: new Container(
        color: Color.fromARGB(255, 108, 134, 153),
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Column(children: [
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: nameController,
                style: TextStyle(decoration: TextDecoration.none),
                //onChanged: (v) => nameController.text = v,
                decoration: new InputDecoration(
                  labelText: 'Fast Food Name',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Builder(
                builder: (context) {
                  return new ElevatedButton(
                    onPressed: () => submitPup(context),
                    child: new Text('Submit Food'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 254, 191, 21)),
                    )
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
