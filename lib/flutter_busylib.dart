library flutter_busylib;

import 'package:flutter_busylib/providers/master_entity/folio1.provider.dart';
import 'package:flutter_busylib/providers/master_entity/master1.provider.dart';
import 'package:flutter_busylib/services/busy.service.dart';

import 'models/master_entity/master1.dart';

class BusyLib{
  final String _baseUrl;
  final String _compCode;
  final String _username;
  final String _password;

  late BusyService? _busyService;
  
  BusyLib({required String baseUrl, required String compCode, required String username, required String password}) : _password = password, _username = username, _compCode = compCode, _baseUrl = baseUrl;
  
  openDB(){
    _busyService = BusyService(baseUrl: _baseUrl, compCode: _compCode, username: _username, password: _password);
    _busyService?.openCompany();
  }
  closeDB(){
    _busyService?.closeCompany();
    _busyService = null;
  }

  Folio1Provider? get folio1Provider => _busyService != null ? Folio1Provider(_busyService!) : null;
  Master1Provider? get master1Provider => _busyService != null ? Master1Provider(_busyService!) : null;

}