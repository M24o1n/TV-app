import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/home.dart';
import 'package:myapp/search.dart';
import 'package:myapp/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => MyList(),
        '/search': (context) => Search(),
      },
    ));
