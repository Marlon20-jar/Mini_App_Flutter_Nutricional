import 'package:flutter/material.dart';
import 'package:flutter_application_7/src/home.dart';
import 'package:flutter_application_7/src/pages/medidas.dart';
import 'package:flutter_application_7/src/pages/calculos.dart';
import 'package:flutter_application_7/src/pages/calorias.dart';


Map <String,WidgetBuilder> getRoutes(){
  return {
        '/'     : (BuildContext context) => HomePage(),
        '/medidas' : (BuildContext context) => Medidas(),
        '/calculos' : (BuildContext context) => Calculos(),
        '/calorias' : (BuildContext context) => Calorias(),
        
  };
}

/*routes: <String, WidgetBuilder>{
          "/inicio": (BuildContext context) => inicio(),
          "/medidas": (BuildContext context) => Medidas(),
          "/calculo": (BuildContext context) => calculo(),
          "/consulta": (BuildContext context) => consulta(),
        },
        home: inicio()
*/