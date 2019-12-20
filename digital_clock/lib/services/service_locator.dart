import 'package:digital_clock/services/preferences_service.dart';
import 'package:flutter/services.dart';
import 'package:digital_clock/managers/app_manager.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setUpServiceLocator(AssetBundle bundle) {
  sl.registerSingleton<PreferencesService>(new PreferencesServiceImplementation(bundle));

// Managers
  sl.registerSingleton<AppManager>(new AppManagerImplementation());
}
