import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/services.dart';
//import 'package:http/http.dart';


class Digimon {
  final String name;
  String imageUrl;
  String apiname;
  String levelDigimon;

  int rating = 10;

  Digimon(this.name);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    //HttpClient http = new HttpClient();
    try {
      //apiname = name.toLowerCase();
      //var uri = new Uri.https('digimon-api.vercel.app', '/api/digimon/name/$apiname');
      //var request = await http.getUrl(uri);
      //var response = await request.close();
      //var responseBody = await response.transform(utf8.decoder).join();
      //List data = json.decode(responseBody);

      List food = [];
      String answer = await rootBundle.loadString('assets/food.json');
      final data = await json.decode(answer);

      food = data[name];
      imageUrl = food[0]["img"];
      levelDigimon = food[0]["level"];

      print(levelDigimon);
    } catch (exception) {
      print(exception);
    }
  }
}
