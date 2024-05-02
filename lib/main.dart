 

 import 'package:flutter/material.dart';
import 'package:preloading/screen/homescreen.dart';

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget{
  final String title="preload image into Cache";

  const MyApp({super.key});

  @override
  Widget build(BuildContext context)=>MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
  home: MainPage(title:title),
  );
}

 