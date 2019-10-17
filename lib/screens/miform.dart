import 'package:flutter/material.dart';
import 'package:mi_shared_preferences_pueba/shared_preferences/shared_preferences.dart';

class MiForm extends StatefulWidget {
  static const route = 'miForm';

  @override
  _MiFormState createState() => _MiFormState();
}

class _MiFormState extends State<MiForm> {
  int _radioValue = 0;

  TextEditingController _textFieldController;

  bool _boolValue;

  void _valueChanged(int value) {
    this._radioValue = value;
    this.prefs.radioValue = value;
    setState(() {});
  }

  final prefs = new MiSharedPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.prefs.lastPage = MiForm.route;
    this._radioValue = prefs.radioValue;
    _textFieldController = new TextEditingController(text: prefs.textValue);
    this._boolValue = prefs.boolValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MiForm'),
          backgroundColor: prefs.boolValue ? Colors.blue : Colors.red,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Radio(
                value: 0,
                activeColor: Colors.blue,
                groupValue: _radioValue,
                onChanged: _valueChanged,
              ),
              Text('Valor 1'),
              Radio(
                value: 1,
                activeColor: Colors.blue,
                groupValue: _radioValue,
                onChanged: _valueChanged,
              ),
              Text('Valor 2'),
              Divider(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: new TextFormField(
                    onChanged: (value) => prefs.textValue = value,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 14),
                    controller: _textFieldController,
                    validator: (_textFieldController) {
                      if (_textFieldController == "")
                        return 'Falta llenar campo';
                      return null;
                    },
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 14),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan)),
                        alignLabelWithHint: true,
                        hintText: '',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Roboto',
                            fontSize: 14))),
              ),
              Divider(),
              SwitchListTile(
                value: _boolValue,
                title: Text('Color secundario'),
                onChanged: (value) {
                  setState(() {
                    _boolValue = value;
                    prefs.boolValue = value;
                  });
                },
              ),
            ],
          ),
        ));
  }
}
