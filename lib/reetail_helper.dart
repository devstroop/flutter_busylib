library reetail_helper;

import 'package:reetail_helper/providers/common_db/company.provider.dart';
import 'package:reetail_helper/providers/common_db/printer_reps.provider.dart';
import 'package:reetail_helper/providers/common_db/screen_reps.provider.dart';
import 'package:reetail_helper/providers/common_db/std_nar.provider.dart';
import 'package:reetail_helper/providers/common_db/user_log.provider.dart';
import 'package:reetail_helper/providers/common_db/user_preference.provider.dart';
import 'package:reetail_helper/providers/common_db/user_preference1.provider.dart';


class ReetailHelper {
  final String baseUrl;
  final String compCode;
  final String username;
  final String password;
  ReetailHelper({required this.baseUrl, required this.compCode, required this.username, required this.password});

  CommonDB commonDB() => CommonDB();
  YearSpecificDB yearSpecificDB() => YearSpecificDB();
}

class CommonDB{
  CompanyProvider companyProvider() => CompanyProvider();
  PrinterRepsProvider printerRepsProvider() => PrinterRepsProvider();
  ScreenRepsProvider screenRepsProvider() => ScreenRepsProvider();
  StdNarProvider stdNarProvider() => StdNarProvider();
  UserLogProvider userLogProvider() => UserLogProvider();
  UserPreferenceProvider userPreferenceProvider() => UserPreferenceProvider();
  UserPreference1Provider userPreference1Provider() => UserPreference1Provider();
}
class YearSpecificDB{

}