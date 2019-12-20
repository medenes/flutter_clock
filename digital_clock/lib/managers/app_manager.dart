import 'package:digital_clock/helpers/clock.dart';
import 'package:digital_clock/services/preferences_service.dart';
import 'package:digital_clock/services/service_locator.dart';

abstract class AppManager {
  Future init();
}

class AppManagerImplementation implements AppManager {


  @override
  // ignore: missing_return
  Future init() {
    var _preferences = sl.get<PreferencesService>();

//    allTheaters = await _preferences.loadTheaters();
//    changedCurrentTheatherCommand.execute(
//        await _preferences.getDefaultTheater(allTheaters));
//
    var now = Clock.getCurrentTime();
    var showDates = new List.generate(
      7,
      (index) => now.add(new Duration(days: index)),
    );
  }
}
