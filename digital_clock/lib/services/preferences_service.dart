import 'package:digital_clock/assets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesService {
  static const String kDefaultTemperatureUnit = 'default_temperature_unit';

  Future<void> saveDefaultTemperatureUnit(TemperatureUnit unit);
  Future<TemperatureUnit> getDefaultTemperatureUnit();
  Future<void> loadTranslations();
}

class PreferencesServiceImplementation implements PreferencesService {
  final AssetBundle _bundle;

  PreferencesServiceImplementation(this._bundle);

  @override
  Future<TemperatureUnit> getDefaultTemperatureUnit() async {
    var persistedTemperatureUnit = (await SharedPreferences.getInstance())
        ?.getString(PreferencesService.kDefaultTemperatureUnit);

    if (persistedTemperatureUnit != null) {
      return TemperatureUnitExtension.fromStringWithDefault(
          persistedTemperatureUnit,
          defaultUnit: TemperatureUnit.fahrenheit);
    }

    return TemperatureUnit.celsius;
  }

  @override
  Future<void> saveDefaultTemperatureUnit(TemperatureUnit unit) async {
    (await SharedPreferences.getInstance())
        .setString(PreferencesService.kDefaultTemperatureUnit, unit.name);
  }

  @override
  Future<void> loadTranslations() async {
    return await this._bundle
        .loadString(OtherAssets.translationMap)
        .then((translationsInString) {

        });
  }
}


/*
*
* Helpful types
*
*/



extension TemperatureUnitExtension on TemperatureUnit {
  static const names = {
    TemperatureUnit.celsius: 'celsius',
    TemperatureUnit.fahrenheit: 'fahrenheit',
  };

  String get name => names[this];

  static TemperatureUnit fromStringWithDefault(String input,
      {TemperatureUnit defaultUnit = TemperatureUnit.celsius}) {
    return TemperatureUnit.values.firstWhere((value) {
      return value.toString().toLowerCase().compareTo(input.toLowerCase()) == 0;
    });
  }
}