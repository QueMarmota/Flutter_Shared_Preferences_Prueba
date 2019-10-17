import 'package:flutter/material.dart';
import 'package:mi_shared_preferences_pueba/shared_preferences/shared_preferences.dart';
import 'miform.dart';
import 'package:path/path.dart';

class Home extends StatelessWidget {
  static final route = 'home';
  final prefs = new MiSharedPreferences();

  @override
  Widget build(BuildContext context) {

      //esta shit solo funciona si en vez de usar pushnamed usamos pushandreplacementnamed
      prefs.lastPage = Home.route;
 

    return Scaffold(
      appBar: AppBar(
        title: Text('Shared preferences'),
        backgroundColor: prefs.boolValue ? Colors.blue : Colors.red,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Radio value ${this.prefs.radioValue}'),
            Text('Bool value ${this.prefs.boolValue}'),
            Text('Text value ${this.prefs.textValue}'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(MiForm.route);
          },
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text('Go Form'),
          )),
    );
  }
}
