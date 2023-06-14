library flutter_busylib;

import 'package:flutter_busylib/providers/common_db/company.provider.dart';
import 'package:flutter_busylib/providers/common_db/printer_reps.provider.dart';
import 'package:flutter_busylib/providers/common_db/screen_reps.provider.dart';
import 'package:flutter_busylib/providers/common_db/std_nar.provider.dart';
import 'package:flutter_busylib/providers/common_db/user_log.provider.dart';
import 'package:flutter_busylib/providers/common_db/user_preference.provider.dart';
import 'package:flutter_busylib/providers/common_db/user_preference1.provider.dart';
import 'package:flutter_busylib/services/busy.service.dart';

class BusyLib{
  final String baseUrl;
  final String compCode;
  final String username;
  final String password;

  BusyService? busyService;
  BusyLib({required this.baseUrl, required this.compCode, required this.username, required this.password});
  openDB(){
    busyService = BusyService(baseUrl: baseUrl, compCode: compCode, username: username, password: password);
  }
  closeDB(){
    busyService?.closeCompany();
    busyService = null;
  }

  CommonDB? get commonDB => busyService != null ? CommonDB(busyService!) : null;
  YearSpecificDB? get yearSpecificDB => busyService != null ? YearSpecificDB(busyService!) : null;
}
class CommonDB{
  final BusyService service;
  CommonDB(this.service);
  CompanyProvider get companyProvider => CompanyProvider(service);
  PrinterRepsProvider get printerRepsProvider => PrinterRepsProvider(service);
  ScreenRepsProvider get screenRepsProvider => ScreenRepsProvider();
  StdNarProvider get stdNarProvider => StdNarProvider(service);
  UserLogProvider get userLogProvider => UserLogProvider(service);
  UserPreferenceProvider get userPreferenceProvider => UserPreferenceProvider(service);
  UserPreference1Provider get userPreference1Provider => UserPreference1Provider(service);
}
class YearSpecificDB{
  final BusyService service;
  YearSpecificDB(this.service);
}