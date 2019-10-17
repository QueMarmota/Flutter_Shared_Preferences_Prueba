# Mi_shared_preferences_pueba

#### Pasos para trabajar con le plugin shared_preferences

* Una vez teniendo la estructura de proyecto donde se necesitan compartir datos ej.

* Home (Se leen los datos de la pagina Settings)
* Settings (Aqui setteamos los datos que se compartiran)
* Shared (Archivo que manipulara el shared_preferences)

* En el archivo Shared tener la siguiente estructura :
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

    // Agregar Getes y setes necesarios
    get radioValue => _prefs.getInt('radioValue') ?? 0;

    set radioValue(value) => _prefs.setInt('radioValue', value);

    }

* En el nivel mas alto del proyecto osea el Main inicializar el singleton del prefs
    void main() async {
    final prefs = new MiSharedPreferences();
    await prefs.initprefs();

    runApp(MyApp());
    }

* Por ultimo donde vamos a setear nuestras shared_preferences lo hacemos con :
prefs.boolValue = value;

* Donde vamos a leer igual :

    Text('Bool value ${this.prefs.boolValue}'),


