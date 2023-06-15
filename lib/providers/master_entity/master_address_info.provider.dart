import 'package:flutter_busylib/models/master_entity/master_address_info.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class MasterAddressInfoProvider {
  final BusyService service;

  MasterAddressInfoProvider(this.service);

  Future<List<MasterAddressInfo>> getAllList({int limit = 10}) async {
    List<MasterAddressInfo> masterAddressInfoList = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${MasterAddressInfo().toMap().keys.join(', ')} FROM MasterAddressInfo LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        masterAddressInfoList
            .add(MasterAddressInfo.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return masterAddressInfoList;
  }
}
