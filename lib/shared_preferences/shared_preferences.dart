import 'package:mi_shared_preferences_pueba/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MiSharedPreferences {
  //Creacion de singleton
  static final MiSharedPreferences _instancia =
      new MiSharedPreferences._internal();

  factory MiSharedPreferences() {
    return _instancia;
  }

  MiSharedPreferences._internal();
  //fin de creacion de singleton
  SharedPreferences _prefs;

  //Inicializar las prefs
  initprefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //Getes y setes
  get radioValue => _prefs.getInt('radioValue') ?? 0;

  set radioValue(value) => _prefs.setInt('radioValue', value);

  get textValue => _prefs.getString('textValue') ?? '';

  set textValue(value) => _prefs.setString('textValue', value);

  get boolValue => _prefs.getBool('boolValue') ?? false;

  set boolValue(value) => _prefs.setBool('boolValue', value);

  get lastPage => _prefs.getString('lastPage') ?? 'home';

  set lastPage(value) => _prefs.setString('lastPage', value);
}
