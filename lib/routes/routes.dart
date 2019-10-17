import 'package:flutter/material.dart';
import 'package:mi_shared_preferences_pueba/screens/home.dart';
import 'package:mi_shared_preferences_pueba/screens/miform.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    //Como pasarle parametros al constructor
    // Navigator.of(context).pushNamed('/nombre-de-la-ruta-que-se definio en material app', arguments:(aqui podemos pasar un map o un object) {'id':id,'algo':algo});
    //Dentro de la clase se debe hacer un
    //final routeArgs = ModalRoute.of(context).settings.arguments as Map<String ,String>
    MiForm.route: (context) => MiForm(),
    Home.route: (context) => Home(),
  };
}
