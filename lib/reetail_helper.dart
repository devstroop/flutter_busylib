library reetail_helper;

import 'package:flutter/material.dart';
import 'package:reetail_helper/providers/common_db/company.provider.dart';
import 'package:reetail_helper/providers/common_db/printer_reps.provider.dart';
import 'package:reetail_helper/providers/common_db/screen_reps.provider.dart';
import 'package:reetail_helper/providers/common_db/std_nar.provider.dart';
import 'package:reetail_helper/providers/common_db/user_log.provider.dart';
import 'package:reetail_helper/providers/common_db/user_preference.provider.dart';
import 'package:reetail_helper/providers/common_db/user_preference1.provider.dart';
import 'package:reetail_helper/services/busy.service.dart';


class ReetailHelper with ChangeNotifier{
  final String baseUrl;
  final String compCode;
  final String username;
  final String password;

  BusyService? busyService;
  ReetailHelper({required this.baseUrl, required this.compCode, required this.username, required this.password});
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
  PrinterRepsProvider get printerRepsProvider => PrinterRepsProvider();
  ScreenRepsProvider get screenRepsProvider => ScreenRepsProvider();
  StdNarProvider get stdNarProvider => StdNarProvider();
  UserLogProvider get userLogProvider => UserLogProvider();
  UserPreferenceProvider get userPreferenceProvider => UserPreferenceProvider();
  UserPreference1Provider get userPreference1Provider => UserPreference1Provider();
}
class YearSpecificDB{
  final BusyService service;
  YearSpecificDB(this.service);
}