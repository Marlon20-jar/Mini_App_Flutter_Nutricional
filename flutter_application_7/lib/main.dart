import 'package:flutter/material.dart';
import 'package:flutter_application_7/rutas/rutas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NutriYo',

    initialRoute: '/',
    routes: getRoutes(),
        
     );
    
  }
}




