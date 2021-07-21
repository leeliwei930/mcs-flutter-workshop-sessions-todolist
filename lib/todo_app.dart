
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todolist/views/home.dart';

import 'lang/todo_translation.dart';



class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  @override
  Widget build(BuildContext context) {


    // Set app orientation to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    return GetMaterialApp(
      title: "Todo.",
      themeMode: ThemeMode.system,
      locale: Locale('en_GB'),
      translations: TodoTranslation(),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


