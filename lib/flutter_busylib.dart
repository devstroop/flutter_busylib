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
  final String _baseUrl;
  final String _compCode;
  final String _username;
  final String _password;

  BusyService? _busyService;
  BusyLib({required String baseUrl, required String compCode, required String username, required String password}) : _password = password, _username = username, _compCode = compCode, _baseUrl = baseUrl;
  openDB(){
    _busyService = BusyService(baseUrl: _baseUrl, compCode: _compCode, username: _username, password: _password);
  }
  closeDB(){
    _busyService?.closeCompany();
    _busyService = null;
  }

  CommonDB? get commonDB => _busyService != null ? CommonDB(_busyService!) : null;
  YearSpecificDB? get yearSpecificDB => _busyService != null ? YearSpecificDB(_busyService!) : null;
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