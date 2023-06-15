library flutter_busylib;

import 'package:flutter_busylib/providers/master_entity/folio1.provider.dart';
import 'package:flutter_busylib/providers/master_entity/master1.provider.dart';
import 'package:flutter_busylib/services/busy.service.dart';

class BusyLib{
  final String _baseUrl;
  final String _compCode;
  final String _username;
  final String _password;

  BusyService? _busyService;
  
  BusyLib(this._baseUrl, this._compCode, this._username, this._password){
    _busyService = BusyService(baseUrl: _baseUrl, compCode: _compCode, username: _username, password: _password);
  }
  
  Future? open() => _busyService?.openCompany();
  Future? close() => _busyService?.closeCompany();
  Future? dispose() => _busyService = null;

  Folio1Provider? get folio1Provider => _busyService != null ? Folio1Provider(_busyService!) : null;
  Master1Provider? get master1Provider => _busyService != null ? Master1Provider(_busyService!) : null;

}
